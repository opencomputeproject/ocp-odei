# OCP - Open Atomic Ethernet (OAE)

This repository serves as a collection of LaTeX documents and their compiled PDFs. The first document in this collection is **Metcalfe_Boggs**, a recreation of the foundational Ethernet paper.

## Getting Started

To generate PDFs from the LaTeX source files, run the following script in the paper's root directory:

```sh
./compileall.sh
```

This script will compile each `.tex` file and produce the corresponding `.pdf` output.

## About `Metcalfe-Boggs`

The `Metcalfe-Boggs` document is a LaTeX recreation of the influential paper:

**"Ethernet: Distributed Packet Switching for Local Computer Networks"** by Robert M. Metcalfe and David R. Boggs, published in 1976.

This paper introduced Ethernet, a pioneering local area network (LAN) technology that revolutionized computer networking. It described a method for enabling multiple computers to communicate efficiently over a shared medium using a system of packet-switching and carrier sense multiple access with collision detection (CSMA/CD). The work laid the foundation for modern wired networking and remains one of the most important contributions to computer science and telecommunications.

## Contributing

If you'd like to contribute additional LaTeX documents, feel free to submit a pull request with your `.tex` file. Ensure that your document compiles correctly using `compileall.sh` before submitting.


