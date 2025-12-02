---
layout: post
title: "Security is a Tradeoff, Not a Checklist"
description: "Security leadership is about solving for risk, not blindly following checklists. Informed tradeoffs often produce better outcomes."
categories: professional commentary
---

One of the most persistent misconceptions in security leadership is the idea that security can be reduced to a set of checkboxes. That once you’ve completed every requirement on a framework, standard, or audit list — you're “secure.”

This mindset is not only false — it’s dangerous.

---

## Security Controls Solve Problems — Not Checkboxes

Every control in a security framework exists because it aims to address a particular risk. But too often, practitioners get locked into the *form* of the control, while forgetting the *function*.

- **A password complexity requirement exists to mitigate credential compromise.**
- **A change management control exists to prevent unauthorized or risky changes.**
- **A vendor due diligence process exists to reduce exposure to third-party risk.**

But real-world business environments often evolve faster than frameworks do. If we only focus on whether a control was implemented "as written," we miss opportunities to solve the underlying problem more effectively — and sometimes more securely.

---

## Example: Password Complexity vs. Passwordless Authentication

A textbook example is password policy. Many organizations cling to increasingly complex password rules: 16 characters, special symbols, forced rotation every 60 days.

Ironically, these rules often lead to worse outcomes:

- Users write passwords down.
- People reuse passwords across systems.
- Support teams deal with constant reset requests.
- Attackers exploit predictable patterns.

The *risk* these rules aim to mitigate is unauthorized access. But alternative controls — such as passkeys, WebAuthn, or hardware tokens — eliminate shared secrets altogether and reduce the attack surface substantially.

In this case, abandoning the checklist-driven approach entirely can **lower risk** rather than increase it.

---

## Example: Compliance Interpretation vs. Business-Aligned Security

Another common scenario arises in compliance-heavy industries. A framework might require “multi-factor authentication for privileged access.”

- A checklist-driven auditor may insist that SMS-based OTP codes qualify.
- A thoughtful security leader might advocate for phishing-resistant authentication (FIDO2, biometrics, or hardware tokens).

Both "meet" the requirement on paper — but one better mitigates modern threat scenarios.

The most mature organizations take these moments to engage with auditors, explain rationale, and document **compensating controls** that better address the risk than the original prescriptive language.

---

## Tradeoffs Are Inevitable — Avoiding the Lazy Default

Security is filled with legitimate tradeoffs:

- **Friction vs. Adoption:** How much user resistance will a control introduce?
- **Cost vs. Coverage:** Are we solving our highest priority risks first?
- **Speed vs. Diligence:** When do we accept fast iteration over exhaustive vetting?
- **Standardization vs. Flexibility:** Should we apply the same control to every asset, or tailor it based on sensitivity?

The key is to avoid defaulting into "safe" checkbox answers simply because they’re familiar or easier to justify. Often, business-aligned alternatives not only maintain compliance — they *improve* security posture.

---

## The Role of Security Leadership

Effective security leaders act as translators between frameworks and reality:

- Understand **the intent** behind controls.
- Propose creative, risk-aligned alternatives when prescriptive controls no longer fit.
- Engage auditors and regulators in good faith, using evidence-based reasoning.
- Avoid control stacking that adds complexity but not meaningful security.

This is not about cutting corners — it's about solving problems **intelligently**, respecting both security objectives and business needs.

---

## Closing Thought

Security isn’t a checklist to complete. It’s a continuous negotiation between evolving risks, operational realities, and organizational priorities. The best security leaders don’t obsess over how many boxes are checked — they obsess over whether the real risks are being mitigated.

---

*This post reflects the kind of pragmatic, real-world security thinking I continue to explore on this site — where nuance matters more than dogma.*

