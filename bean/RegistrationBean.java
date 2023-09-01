package bean;

import java.io.Serializable;
// MemberIdBeanをextendsするとどうなる？？？

public class RegistrationBean implements Serializable{
    private int matchId;
    private int teamId;
    private MemberIdBean memberIdBean = null;

    public RegistrationBean(){
        memberIdBean = new MemberIdBean();
    }

    public void setMatchId(int matchId){
        this.matchId = matchId;
    }
    public void setTeamId(int teamId){
        this.teamId = teamId;
    }
    public void setMemberId(int[] memberId){
        this.memberIdBean.setMemberId(memberId);
    }

    public int getMatchId(){
        return matchId;
    }
    public int getTeamId(){
        return teamId;
    }
    public int[] getMemberId(){
        return memberIdBean.getMemberId();
    }
}
