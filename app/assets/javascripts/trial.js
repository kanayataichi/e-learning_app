// 試験実施画面.解答ボタン用
// 正解の場合、正解用のタグを表示
// 不正解の場合、不正解用のタグを表示
function disp_result(obj)
{

  // 正解・不正解のタグを隠す
  obj.getElementById('win').style.display='none';
  obj.getElementById('lose').style.display='none';
  
  // 解答候補から選択されたラジオボタンを取得
  var select_answer;
  var answer = obj.getElementsByName('answer_content');  
  for(var i=0;i<answer.length;i++) {
    if (answer[i].checked) {
      select_answer = i + 1;
      break;
    }  
  }
  
  // 解答候補から選択した解答と模範解答が一致している場合は、正解を表示
  // 解答候補から選択した解答と模範解答が一致しない場合は、不正解と解説を表示
  if (select_answer == obj.getElementById("model_answer").value) {
    obj.getElementById('win').style.display='block';
  }else{
    obj.getElementById('lose').style.display='block';
  }
}