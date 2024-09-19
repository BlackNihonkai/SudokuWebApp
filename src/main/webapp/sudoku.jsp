<%-- 
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
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sudoku</title>
    <style>
        table {
            border-collapse: collapse;
            margin: 20px auto;
            font-size: 20px;
            text-align: center;
        }
        td {
            width: 40px;
            height: 40px;
            border: 1px solid black;
            vertical-align: middle;
        }
        /* 3x3のブロックを区切る太い線 */
        td.block-border-top {
            border-top: 3px solid black;
        }
        td.block-border-left {
            border-left: 3px solid black;
        }
        td.block-border-right {
            border-right: 3px solid black;
        }
        td.block-border-bottom {
            border-bottom: 3px solid black;
        }
    </style>
</head>
<body>
    <h1>Sudoku Board</h1>
    <table>
        <%
            int[][] board = (int[][]) request.getAttribute("sudokuBoard");
            if (board != null) {
                for (int i = 0; i < 9; i++) {
                    out.println("<tr>");
                    for (int j = 0; j < 9; j++) {
                        // 各セルにCSSクラスを割り当てることで3x3の区切り線を作成
                        String cssClass = "";
                        if (i % 3 == 0) cssClass += " block-border-top";
                        if (i == 8) cssClass += " block-border-bottom";
                        if (j % 3 == 0) cssClass += " block-border-left";
                        if (j == 8) cssClass += " block-border-right";

                        out.println("<td class='" + cssClass.trim() + "'>" + (board[i][j] == 0 ? "" : board[i][j]) + "</td>");
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
