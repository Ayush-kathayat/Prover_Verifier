# Circuit Logic with Circom Programming Language

## Description

This project aims to create a custom logic circuit using the Circom programming language. The circuit implements a logical gate that checks whether the output 'q' is the result of multiplying inputs 'a' and 'b'.

## Getting Started

### Installation

To work with this project, you need to follow these steps:

1. Download the Circom programming language from the official website: [Circom](https://www.circom.io/).
2. Install Circom on your system by following the instructions provided in the documentation.

### Executing the Program

To run the circuit, follow these steps:

1. Open your terminal or command prompt and navigate to the project directory.
2. Compile the circuit by executing the following command:

```bash
npm install
```

3. After successful installation , Compile the Circuit:

```bash
npx hardhat circom 
```

4. Deployment:  I am deploying the circuit on the Polygon Mumbai testnet , you can use any testnet 

```bash
npx hardhat run scripts/deploy.ts --network mumbai
```


## Circuit Logic

The circuit logic is implemented using Circom and consists of three templates for the basic logic gates: AND, OR, and NOT. The main custom circuit 'LooseCircuit' is constructed using these gates.

### AND Gate

The AND gate template takes two input signals, 'a' and 'b', and produces the output signal 'out', representing the logical AND of 'a' and 'b'.

```circom
template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a * b;
}
```

### OR Gate

The OR gate template takes two input signals, 'a' and 'b', and produces the output signal 'out', representing the logical OR of 'a' and 'b'.

```circom
template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a * b;
}
```

### NOT Gate

The NOT gate template takes an input signal 'in' and produces the output signal 'out', representing the logical NOT of 'in'.

```circom
template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2 * in;
}
```

### Custom Circuit - LooseCircuit

The main custom circuit 'LooseCircuit' uses the AND, NOT, and OR gates to implement the logic for multiplying inputs 'a' and 'b' and producing the output 'q'.

```circom
pragma circom 2.0.0;

template LooseCircuit() {

    // signal inputs 'a' and 'b'
    signal input a;
    signal input b;

    // Signals for intermediate results, stored in 'x' and 'y'
    signal x;
    signal y;

    // Output signal 'q' (Our Answer)
    signal output q;

    // Components for the gates: AND, OR, and NOT
    component andGate = AND();
    component orGate = OR();
    component notGate = NOT();

    // Circuit Logic:

    // AND gate
    andGate.a <== a;
    andGate.b <== b;
    x <== andGate.out;

    // NOT gate
    notGate.in <== b;
    y <== notGate.out;

    // OR gate
    orGate.a <== x;
    orGate.b <== y;
    q <== orGate.out;
}

component main = LooseCircuit();
```

After following the installation and execution steps, the circuit will be successfully implemented, and you will obtain the desired output 'q' based on the inputs 'a' and 'b'.

## Help
If you encounter any issues or have questions about the program, please refer to the official Circom documentation or seek help from the community.

# Author
[Ayush Kathayat]

License
This project is licensed under the MIT License.

