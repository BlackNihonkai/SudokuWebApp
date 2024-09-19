/**
 * 
 */
package com.sudoku;

/**
 * 
 */
public class MakeBoard {
	public static final int N = 9;
	public static final int B = 3;
	public static boolean canBePlaced(int[][] board, int targetRow, int targetCol, int x){
		//check関数で仮に入れられた値が、縦・横・その値の所属の3×3マス（太枠）にあれば0を返す
		//（なければ1を返す)
		int i, j, topLeft;
		for(i=0; i < N; i++) {
			if(board[targetRow][i] == x) {
				// 行に同じ数があるか確認。あればfalse
				return false;
			}
			if(board[i][targetCol] == x) {
				// 列に同じ数があるか確認。あればfalse
				return false;
			}
		}
		// 3x3枠の左上の位置を計算
        int topLeftRow = (targetRow / B) * B;
        int topLeftCol = (targetCol / B) * B;

        // 3x3枠内のチェック
        for (int k = 0; k < B; k++) {
            for (int l = 0; l < B; l++) {
                if (board[topLeftRow + k][topLeftCol + l] == x) {
                    return false;
                }
            }
        }

        // 縦・横・3x3枠に同じ数字がない場合、配置可能
        return true;
	}
	public static void count0() {
		//配列内０の数を数える
	}
	public static void cloneBoard() {
		//前の配列を後ろのにコピペ
	}
	public static void rand9() {
		
	}
	public static void rand81() {
		
	}
	public static void check() {
		// 盤面のチェック
	}
	public static void maker1() {
		//問題作成１　ランダムver
	}
	public static void maker2(int[][] board, int n) {
		//問題作成２　順番指定ver
		int[][] cntBoard={
				{46,47,48,10,11,12,55,56,57},
				{49,50,51,13,14,15,58,59,60},
				{52,53,54,16,17,18,61,62,63},
				{19,20,21, 1, 2, 3,28,29,30},
				{22,23,24, 4, 5, 6,31,32,33},
				{25,26,27, 7, 8, 9,34,35,36},
				{64,65,66,37,38,39,73,74,75},
				{67,68,69,40,41,42,76,77,78},
				{70,71,72,43,44,45,79,80,81}};
		for(int row=0; row < N; row++) {
			for(int col=0; col < N; col++) {
				int c = 0;
				// cntBoardの値を基に、board上のマスのインデックスを求める
                int targetRow = (cntBoard[row][col] - 1) / N;
                int targetCol = (cntBoard[row][col] - 1) % N;

                // マスの値を一時的に保存して0にする
                int tmp = board[targetRow][targetCol];
                board[targetRow][targetCol] = 0;

                // 1からNまでの値がそのマスに置けるかどうか確認
                for (int i = 1; i <= N; i++) {
                    if (canBePlaced(board, targetRow, targetCol, i)) {
                        c++;
                    }
                }

                // 候補が1つしかない場合、そのままにする
                // それ以外の場合、元の値を戻す
                if (c != 1) {
                    board[targetRow][targetCol] = tmp;
                }
			}
		}
	}
	public void getBoard() {
		// 例でのmain関数の部分
	}
}
