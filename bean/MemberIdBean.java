package bean;

import java.io.Serializable;

// 試合に参加する6人のIDを参加順に保存
// 1試合目後衛サイド=0, 1試合目前衛サイド=1
// 2試合目後衛サイド=2, 1試合目前衛サイド=3
// 3試合目後衛サイド=4, 1試合目前衛サイド=5

public class MemberIdBean implements Serializable{
    private int[] memberId;

    public MemberIdBean(){
        memberId = new int[6];
    }

    public void setMemberId(int[] memberId){
        for(int i=0; i<memberId.length; i++){
            this.memberId[i] = memberId[i];
        }
    }

    public int[] getMemberId(){
        return memberId;
    }
}
