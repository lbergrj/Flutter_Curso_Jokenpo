import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  String _mensagem = "";

  void _opcaoSelecionada(String escolhaUsuario){
    var opcoes =  ["pedra", "papel", "tesoura"];
    int numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];
    print(escolhaApp);
    print(escolhaUsuario);

    //Exibir imagem pelo App
    switch(escolhaApp){
      case "pedra":
        setState(() {
          this._imagemApp =  AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp =  AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp =  AssetImage("images/tesoura.png");
        });
        break;
    }

    //Validação ganhador
    if( escolhaUsuario == escolhaApp){
      setState(() {
        this._mensagem = "Partida empatada";
      });
    }
    else if( (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel" )){
      setState(() {
        this._mensagem = "Parabéns !!! Você venceu !!";
      });

    }
    else{
      setState(() {
        this._mensagem = "Vitória do App";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedra , Papel e Tesoura"),
      ),
      body: Container(
        //padding: EdgeInsets.all(20),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
                ),
              ),
            ),
            Image(image: _imagemApp),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 16),
              child: Text(
                "Escolha uma opção abaixo",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  child:Image.asset("images/pedra.png",height:100),
                  //No onTap é necessário usarmos uma função anônima retornando uma void
                  //para que possamos usar uma void
                  onTap: () => _opcaoSelecionada("pedra"),
                ),
                GestureDetector(
                  child: Image.asset("images/papel.png",height:100),
                  onTap: () =>  _opcaoSelecionada("papel"),
                ),
                GestureDetector(
                  child:Image.asset("images/tesoura.png",height:100),
                  onTap: () => _opcaoSelecionada("tesoura"),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 16),
              child: Text(
                this._mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
