VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} FormComenta1 
   Caption         =   "Comentários do Professor referente à "
   ClientHeight    =   5355
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   6840
   OleObjectBlob   =   "FormComenta1.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "FormComenta1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub ComboBox1_Change()
 Select Case ComboBox1.ListIndex
  Case "0"
   TextBox1.Value = "Aluno(a) apresentou ótimo desempenho geral e nenhum problema no seu processo de aprendizagem até o presente momento. Parabéns pelo bom progresso."
  Case "1"
   TextBox1.Value = "Aluno(a) apresentou desempenho escrito e oral satisfatórios."
  Case "2"
   TextBox1.Value = "Embora o(a) aluno(a) tenha apresentado bom desempenho em aula, ele/ela tem entregado lições de casa com atraso. É de extrema importância que ele/ela mude este hábito para evitar problemas em seu progresso nos estudos."
  Case "3"
   TextBox1.Value = "Aluno(a) poderia apresentar desempenho melhor se ele(a) não faltasse tanto. Quando o número de faltas é superior a 9 faltas, o(a) aluno(a) é impedido de participar de aulas de apoio e, se não justificadas, estas faltas não tem direito a serem repostas."
  Case "4"
   TextBox1.Value = "Aluno(a) apresentou desempenho escrito satisfatório. Contudo, precisa melhorar seu desempenho oral. Para tal, sugire-se que ele/ela adote os seguintes hábitos: 1) Fazer as lições de casa em dia; 2) Participar das aulas de apoio oral e escrito; 3) Ser mais participativo das aulas; 4) Não copiar lições, seja da cave de respostas o do colega; 5) Tirar dúvidas antes de entregar lições."
  Case "5"
   TextBox1.Value = "Aluno(a) apresentou desempenho geral abaixo do satisfatório. Para tal, sugire-se que ele/ela adote os seguintes hábitos: 1) Fazer as lições de casa em dia; 2) Participar das aulas de apoio oral e escrito; 3) Ser mais participativo das aulas; 4) Não copiar lições, seja da cave de respostas o do colega; 5) Tirar dúvidas antes de entregar lições."
  Case "6"
   TextBox1.Value = "Aluno(a) apresentou desempenho oral satisfatório, mas precisa melhorar o desempenho escrito. Para tal, sugire-se que ele/ela adote os seguintes hábitos: 1) Fazer as lições de casa em dia; 2) Participar das aulas de apoio oral e escrito; 3) Ser mais participativo das aulas; 4) Não copiar lições, seja da cave de respostas o do colega; 5) Tirar dúvidas antes de entregar lições."
  Case "7"
   TextBox1.Value = "Aluno(a) apresentou bom desempenho em aulas, contudo tem chegado muito atrasado(a) às aulas, o que prejudica a si e aos outros. Precisa evitar estes atrasos frequentes."
  Case "8"
   TextBox1.Value = "Embora o(a) aluno(a) tenha apresentado bom desempenho em aula, suas lições de casa tem sido entregues incompletas. Ele/Ela deve completar as que já entregou e entregar para uma nova correção."
  Case "9"
   TextBox1.Value = "Aluno(a) apresentou bom desempenho geral, porém tem mantido conversas paralelas que atrapalham ele(a) mesmo(a) e os outros e deve policiar-se para não repetir este hábito prejudicial ao seu desempenho."
  Case "10"
   TextBox1.Value = "Aluno(a) apresentou desempenho satisfatório que poderia ser melhor se ele(a) presta-se mais atenção para aprender tudo que necessita para manter um bom progresso no seu aprendizado. Precisa melhorar esta questão."
  Case "11"
   TextBox1.Value = "Embora o(a) aluno(a) tenha apresentado desempenho regular em aula, não entregou lições de casa o que impossibilita a avaliação do seu desempenho escrito."
  Case "12"
   TextBox1.Value = "Aluno(a) aparenta ser esforçado e dedicado, porém não tem apresentado um desempenho adequado. Sugiro que ele(a) participe das aulas de monitoria para melhorar seu desempenho. Estas aulas acontecerão da seguinte forma:"
  Case "13"
   TextBox1.Value = "Infelizmente o(a) aluno(a) não tem apresentado um bom desempenho em aula, por não estar prestando atenção suficiente a aula, não estar se dedicando o suficiente. Ele(a) precisa prestar mais atenção, participar ativamente das aulas e participar das aulas de apoio. Estas aulas serão oferecidas da seguinte forma:"
  Case "14"
   TextBox1.Value = "Aluno(a) tem apresentado um desempenho em construção precisando ..."
  Case "15"
   TextBox1.Value = "Aluno(a) necessita participar das aulas de apoio oferecidas ... para melhorar seu desempenho. Nessas aulas, o(a) aluno(a) deve trazer suas dúvidas e se comprometer com todas as atividades como nas aulas regulares e, caso não possa participar, o responsável precisa avisar o professor."
  Case "16"
   TextBox1.Value = "Aluno(a) precisa fazer aula(s) de reposição referente a(s) aula(s) que faltou e justificou para poder acompanhar adequadamente o conteúdo de aula."
  Case "17"
   TextBox1.Value = "Aluno(a) tem frequentemente solicitado para sair de sala para ir ao banheiro ou para beber água. Este hábito tem prejudicado o mesmo e aos outros. É indicado que o(a) aluno(a) vá ao banheiro antes da aula, no intervalo ou no término de aula. No caso de água, o(a) aluno(a) pode trazer uma garrafa ou squeeze se desejar ou deixar para os mesmos intervalos do banheiro."
  Case "18"
   TextBox1.Value = "Aluno(a) tem usado o celular dentro de sala de aula para fins NÃO educacionais e este hábito tem tirado sua total concentração na aula. Este hábito deve ser erradicado com risco de seu celular ser confiscado pelo professor se repetir tal atitude e só devolvido ao responsável."
 End Select
End Sub

Private Sub CommandButton1_Click()
 [D73] = TextBox1.Value
 FormComenta1.Hide
End Sub

Private Sub CommandButton2_Click()
 FormComenta1.Hide
End Sub

Private Sub UserForm_Initialize()
 ComboBox1.Clear
 TextBox1.Value = ""
 With ComboBox1
  .AddItem "Sem problemas", "0"
  .AddItem "Desenvolvimento satisfatório", "1"
  .AddItem "Lições em atraso", "2"
  .AddItem "Muitas faltas", "3"
  .AddItem "Baixo desempenho oral", "4"
  .AddItem "Baixo desempenho geral", "5"
  .AddItem "Baixo desempenho escrito", "6"
  .AddItem "Chega Atrasado", "7"
  .AddItem "Lições Incompletas", "8"
  .AddItem "Conversa demais", "9"
  .AddItem "Não Presta atenção", "10"
  .AddItem "Não entregou lições", "11"
  .AddItem "Desempenho não adequado", "12"
  .AddItem "Aluno(a) não colabora", "13"
  .AddItem "Aluno(a) precisa ...", "14"
  .AddItem "Aulas de apoio", "15"
  .AddItem "Aulas de Reposição", "16"
  .AddItem "Aluno sai da sala (Banheiro/Água)", "17"
  .AddItem "Uso de celular em aula", "18"
 End With
End Sub
