pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template LooseCircuit () {  

    // signal inputs A and b
    signal input a;
    signal input b;
    

    // Signals from the gates this is the  intermediate result which will be stored in the X and Y
    signal x;
    signal y;


    // final signal output which is Q (Our Answer)
    signal output q;


    // The components which we will be using to create our custom circuit and for this circuit we need AND , OR and NOT gates

    component andGate = AND();  // component for the AND gate
    component orGate = OR();  // component for the OR gate
    component notGate = NOT();  // component for the NOT gate

    // My LooseCircuit logic  below :


    // for and gate
    andGate.a <== a;
    andGate.b <== b;

    x <== andGate.out;


    // for not gate

    notGate.in <== b;

    y <== notGate.out;


    // Now at last when we have got our X and Y we will do OR 

    orGate.a <== x;
    orGate.b <== y;

    q <== orGate.out;




}


// Below are the templates of the gates i will be using in my circuit logic 

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;

    
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = LooseCircuit();