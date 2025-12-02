---
layout: post
title: "Private, Local Audio Transcription Without Compromise"
description: How I built my own transcription stack to keep voice data private while delivering professional results
categories: secure architecture
---

Like most of us, I rely on voice memos more than I care to admit — quick ideas, reminders, sometimes full-on rants when my hands are busy. But getting those recordings transcribed always felt like a privacy tradeoff I wasn’t comfortable making.

Most transcription tools out there (especially the accurate ones) ship your audio off to someone else's cloud. And while that’s convenient, it also means sending sensitive content — personal or professional — into environments I don’t control.

So I built my own stack.

This post walks through how I now transcribe audio locally, without leaking data, and still get professional-grade results. It's a bit of a choose-your-own-adventure setup, depending on what kind of speed and accuracy you need. All the code is [available on GitHub](https://github.com/heffrey/transcriptions) if you want to try it yourself.

---

## Why I Built This

I didn’t start out trying to create four different transcription pipelines. I just wanted something fast, reliable, and private. But every tool had tradeoffs — GPU vs. CPU, speed vs. accuracy, simplicity vs. configurability. So I iterated until I had a few solid options.

At a high level, the goals were:

- **100% local processing**
- **High transcription quality**
- **Zero data sent to third parties**
- **Works offline**
- **Flexible enough for different devices**

---

## The Tools I Use

Here are the transcription engines I ended up building or tweaking. Whisper is the standout, but Vosk has its place too depending on the context.

### 1. Whisper with GPU — Fast and Nearly Perfect

This is my go-to. When I’m on a machine with a decent GPU, Whisper absolutely flies — transcribing a 90-second file in under 3 seconds with near-perfect accuracy.

```bash
python transcribe_whisper.py "Recording.m4a" -m large -d cuda
```

Or if I’m doing something quick and don’t need top-tier accuracy:

```bash
python transcribe_whisper.py "Recording.m4a" -m tiny -d cuda
```

Fallback to CPU works too — just slower.

The best part? Nothing ever leaves my machine. No APIs. No terms of service. No telemetry.

---

### 2. Fast Vosk — Good Speed, Solid Accuracy

This one is great when I need something simple and don’t have GPU access. It processes 90 seconds of audio in about 20–30 seconds and gets around 85% accuracy.

I added chunking and threading to speed it up a bit. Here’s the core idea:

```python
# Split audio into 30s chunks
chunk_size = int(chunk_duration * bytes_per_second)

# Multi-thread each chunk
for chunk_id, chunk_data in chunks:
    thread = threading.Thread(
        target=lambda: results.append(
            transcribe_chunk(chunk_data, model, chunk_id)
        )
    )
```

---

### 3. Ultra-Fast Vosk — When I Just Want a Draft

I stripped things down to make this one even faster. 10–15 seconds for 90 seconds of audio. Accuracy is closer to 80%, but that’s fine when I just want to capture the gist of something.

---

### 4. Standard Vosk — Dead Simple, Still Useful

This was my original setup. Slower (30–60 seconds per file), but it’s lightweight and doesn’t rely on anything fancy. Good to have in the toolkit, especially for low-resource systems.

---

## Architecture Overview

At the core, they all follow the same flow:

1. **Convert audio to WAV** (using `ffmpeg`)
2. **Split into chunks** if needed
3. **Run local model inference**
4. **Reconstruct the transcript**

Here’s what I use for conversion:

```python
cmd = [
    'ffmpeg', '-i', m4a_path, 
    '-acodec', 'pcm_s16le', 
    '-ar', '16000', 
    '-ac', '1', 
    '-y', output_path
]
```

And a quick check for GPU availability:

```python
if torch.cuda.is_available():
    device = "cuda"
else:
    device = "cpu"
```

---

## Why This Matters

There are real privacy and security implications here. When you send voice memos to Google or Amazon for transcription, you’re handing over:

- Personal notes
- Business conversations
- Sensitive context (legal, medical, financial)

Even if you trust the service provider, you’re still subject to:

- Data retention policies
- Subpoenas
- Algorithmic analysis
- Who-knows-what usage agreements

By keeping everything local, I get full data sovereignty. And as someone who works in security, that matters.

---

## Real Results

Whisper on GPU is hands-down the best performer:

| Method              | Time   | Accuracy | Private | GPU |
|---------------------|--------|----------|---------|-----|
| Whisper (GPU)       | ~3s    | 90–95%   | ✅      | ✅  |
| Whisper (CPU)       | ~10–20s| 90–95%   | ✅      | ❌  |
| Fast Vosk           | ~20s   | 85%      | ✅      | ❌  |
| Ultra-Fast Vosk     | ~10s   | 80%      | ✅      | ❌  |
| Standard Vosk       | ~45s   | 85%      | ✅      | ❌  |

And a quick transcription comparison:

```text
Original:     “Thank you for trusting me with all that.”
Vosk Output:  “thank you for trusting you with all that”
Whisper:      “Thank you for trusting me with all that.”
```

---

## Setup and Cost

Everything I've built is open source and runs locally. No usage fees. Just download the models and go. You can find all the scripts, setup instructions, and documentation in the [transcriptions repository](https://github.com/heffrey/transcriptions).

- **Whisper**: Requires `torch`, `ffmpeg`, model files
- **Vosk**: Lightweight, minimal dependencies

The only cost is your hardware. If you've got a decent GPU, Whisper sings.

---

## What’s Next

This stack works great for me today, but I’m planning to add:

- Real-time transcription
- Multi-language support
- Speaker labeling
- Web interface for file uploads

It’s also easy to imagine this integrating into note-taking workflows, journaling apps, or secure comms platforms.

---

## Final Thought

There's no reason voice transcription should be a privacy sacrifice. The tools are out there — they just need stitching together in the right way.

And honestly? It's kind of fun.

If you want to try this yourself, check out the [transcriptions repository](https://github.com/heffrey/transcriptions) on GitHub. It includes all four scripts, setup instructions, and everything you need to get started with private, local transcription.
