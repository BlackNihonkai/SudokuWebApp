<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sudoku Board</title>
</head>
<body>
<h1>Sudoku Board</h1>
    <table border="2" style="border-collapse:collapse">
        <%
            // boardがnullでないか確認
            int[][] board = (int[][]) request.getAttribute("sudokuBoard");
            if (board != null) {
                for (int i = 0; i < 9; i++) {
                    out.println("<tr>");
                    for (int j = 0; j < 9; j++) {
                        // boardの値が0の場合は空白、それ以外は数字を表示
                        out.println("<td>" + (board[i][j] == 0 ? "" : board[i][j]) + "</td>");
                    }
                    out.println("</tr>");
                }
            } else {
                out.println("<p>Error: Sudoku board not found!</p>");
            }
        %>
    </table>
</body>
</html>