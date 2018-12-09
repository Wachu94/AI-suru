class NeuralNetwork
{
  
  int inputs, hiddens, outputs;
  
  
  Matrix output_hidden;
  Matrix hidden_hidden;
  Matrix hidden_input;
  
  
  NeuralNetwork(int inputs, int hiddens, int outputs)
  {
    this.inputs = inputs;
    this.hiddens = hiddens;
    this.outputs = outputs;
    
    
    output_hidden = new Matrix(outputs, hiddens +1);
    hidden_hidden = new Matrix(hiddens, hiddens +1);
    hidden_input = new Matrix(hiddens, inputs +1);

    output_hidden.randomize();
    hidden_hidden.randomize();
    hidden_input.randomize();
  }
}