# Self-Organized Freeform Waveguiding (Reaction–Diffusion Model)

This repository provides a minimal and reproducible MATLAB implementation of a reaction–diffusion (Gray–Scott) model used to generate self-organized patterns under geometric constraints, as presented in the paper **“Self-Organized Freeform Waveguiding”**.

The code illustrates how local reaction–diffusion dynamics, inspired by natural pattern formation, can be combined with an imposed forbidden region to generate morphogenetic structures embedding a predefined waveguiding path, without any global optimization.

---

## Code description

The script:
- Solves the Gray–Scott reaction–diffusion equations on a 2D grid  
- Generates circular Turing patterns from random initial conditions  
- Enforces a predefined waveguide geometry as a forbidden region during pattern evolution  
- Produces both continuous concentration fields and binarized structures used for waveguide design  

The example provided corresponds to a **90-degree bent waveguide**, but the geometry can be easily modified by editing the waveguide mask section.

---

## Requirements

- MATLAB (no specific toolbox required)

---

## How to run

1. Open the MATLAB script  
2. Run the file  
3. The script displays:
   - The temporal evolution of the reaction–diffusion pattern  
   - The final binarized structure used for waveguide generation  

---

## Notes

- Model parameters (`f`, `k`, diffusion coefficients) are chosen to generate circular spot patterns.
- Waveguide width and geometry can be modified by adjusting the waveguide mask.
- The script is intended as a **demonstration and reproducibility tool**, not as an optimized or performance-oriented implementation.

---

## License

This code is provided for **academic and research purposes only**.

---

## Citation

If you use this code, please cite:

Chehami, F., Decroze, C., Smith, D. R., & Fromentèze, T. (2025). Self-Organized Freeform Waveguiding. arXiv preprint arXiv:2512.01699.
