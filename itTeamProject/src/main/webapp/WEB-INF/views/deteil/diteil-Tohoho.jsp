<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
  <head>
	<meta charset="EUC-KR">
	<title>TCP���� �Ұ�</title>
    <link rel="stylesheet" type="text/css" href="reset.css" />
    <style>
      .img-concert {
        width: 200px;
        height: 100px;
      }
    </style>
  </head>
  <body>
 <h1>�Ȫ۪۪Σ�������ڦ</h1>
  
  <h1>�̹��� �Ұ��� ����Ʈ�� ��ȣȣ www�Թ� �̶�� �Ϻ� ����Ʈ �Դϴ�.</h1>
  <p>�� ����Ʈ�� ����Ʈ �̸������� �� �� �ֵ��� �Ϻ� ����Ʈ�Դϴ�. ���ڻ��̶� ���� ����ٴ� ������ ������  
  �Ϻ��� �ѱ��� � ���� �ٸ��� �Ϻ���� ��� �����ϰ� �ִ��� Ȯ�� �� �� �־� ������� �ڵ��� �Ϻ��� ������ �ִٸ� 
  �Ϻ����� ���ϰ� �Ͱų� �ʿ䰡 �ִٸ� ������ �д´ٴ� ������ �������� ������ ���� ���� ���� .</p>
 
  
 <a href="#" target='_black' onclick=test2() id="">
    <img class="img-concert" src="https://www.tohoho-web.com/image/tohowww.gif" />
  </a>
  </body>
  
  <script>
    function test2() {
        if (!confirm("���� �ϱ���� ���� �̵� �Ͻðڽ��ϱ�?")) {
            alert("���(�ƴϿ�)�� �����̽��ϴ�.");
        } else {
            alert("���� �ϱ������� �̵��մϴ�.");
            window.open("https://www.tohoho-web.com/www.htm");
            window.location = '/board/list';
        }
    }
</script>
</html>