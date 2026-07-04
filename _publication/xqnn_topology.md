---
layout: publication
title: "Explainable Quantum Neural Networks for Multi-Material Topology Optimization"
year: 2026
month: 7
authors:
  - Dahyun Joo
  - Naruethep Sukulthanasorn
  - Kenjiro Terada
  - Do-Nyun Kim
venue: >
  <em>Submitted; arXiv preprint arXiv:2607.00438 (2026).</em>

tldr: >
  We propose XQNN, an explainable quantum neural network that simultaneously determines load-carrying structural layout and material type assignment for multi-material topology optimization, generalizing across resolutions and 3D problems without additional training.

venue_full: "arXiv preprint arXiv:2607.00438 (2026), submitted."
abstract: "We propose an explainable quantum neural network for multi-material topology optimization, XQNN, that determines both load-carrying structural layout and material type assignment for given boundary/loading conditions. Intermediate solution histories are first converted into element-wise strain energy, sensitivity, density, and Sobel boundary descriptors. Then, they are encoded in a ten-qubit circuit and qubit-wise Z observables are mapped onto material type labels. Trained only on two-dimensional topology optimization histories obtained with a fixed mesh resolution, XQNN can be generalized to handle out-of-distribution boundary/loading conditions, progressively refined high-resolution meshes, and voxel-wise three-dimensional problems without additional training. We find that it is important to preserve qubit-wise observables and add boundary information for improving the optimization accuracy, and certain observables have consistent links to load paths, material type regions, and interfaces, demonstrating their usability as auditable mechanics-facing variables."
note: "Submitted; arXiv preprint arXiv:2607.00438 (2026)."
arxiv: "https://arxiv.org/abs/2607.00438"
paper: "https://arxiv.org/pdf/2607.00438"
image: "/assets/publication/Explainable quantum neural networks for multi-material topology optimization/fig_pic.png"
category:
  - "Quantum Computing"
  - "Topology Optimization"
  - "Neural Networks"
  - "Explainability"
featured: true
type: Quantum Machine Learning
---
