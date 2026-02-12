---
layout: publication
title: "CLIP-RT : Learning Language-Conditioned Robotic Policies from Natural Language Supervision"
year: 2025
month: 04
authors:
  - Gi-Cheon Kang
  - Junghyun Kim 
  - Kyuhwan Shim 
  - Jun Ki Lee 
  - Byoung-Tak Zhang
coauthors:
  - Gi-Cheon Kang
  - Junghyun Kim 
venue: >
  <a href="https://roboticsconference.org"> <strong>Robotics: Science and Systems (RSS) 2025</strong>  </a><br>
  <a href="https://sites.google.com/view/langrob-corl24/">3rd Workshop on Language and Robot Learning (LangRob)</a> @ <a href="https://corl2024.org"> <strong>CoRL 2024</strong></a>
tldr: >
  We explore how non-experts can teach robotic skills only through natural language supervision. We propose 'CLIP-RT', the VLA model that learns visuomotor policies directly from this supervision.


abstract: >
  Teaching robots desired skills in real-world environments remains challenging, especially for non-experts. A key bottleneck is that collecting robotic data often requires expertise or specialized hardware, limiting accessibility and scalability. We posit that natural language offers an intuitive and accessible interface for robot learning. To this end, we study two aspects: (1) enabling non-experts to collect robotic data through natural language supervision (e.g., “move the arm to the right”) and (2) training robot policies directly from this supervision. Specifically, we introduce a data collection framework that collects robot demonstrations based on natural language supervision and further augments these demonstrations. We then present CLIP-RT, a new vision-language-action (VLA) model that learns language-conditioned visuomotor policies from this supervision. CLIP-RT adapts the pretrained CLIP model and learns to predict language-based motion primitives via contrastive imitation learning. We train CLIP-RT on the Open X-Embodiment dataset and finetune it on in-domain data collected by our framework. In real-world evaluations, CLIP-RT demonstrates strong capabilities in learning novel manipulation skills, outperforming OpenVLA (7B parameters) by 24% in average success rates, while using 7x fewer parameters (1B). We further assess CLIP-RT’s capabilities in few-shot generalization and collaborative scenarios involving large pretrained models or humans. In simulated environments, CLIP-RT also yields strong performance, achieving a 92.8% average success rate on the LIBERO benchmark with an inference throughput of 163 Hz.
paper: "https://arxiv.org/abs/2411.00508"
page: "https://clip-rt.github.io"
github: "https://github.com/clip-rt/clip-rt"
poster: "http://clip-rt.github.io/poster.pdf"
image: "/assets/images/publication/cliprt.gif"
category: 
  - "Robotics"
  - "LLM"
  - "VLA"
bibtex: |-
  @article{kang2024cliprt,
  title={CLIP-RT: Learning Language-Conditioned Robotic Policies from Natural Language Supervision},
  author={Kang, Gi-Cheon and Kim, Junghyun and Shim, Kyuhwan and Lee, Jun Ki and Zhang, Byoung-Tak},
  journal={arXiv preprint arXiv:2411.00508},
  year = {2024}
featured: true
type: Robot Transformer, Vision-Language Model
---
