package com.springapp.entity;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;

/**
 * Created by Arsen Adzhiametov on 7/31/13.
 */
@Entity(name = "vote")
public class Vote {
    private Integer voteCount;
    private int voteId;
    private Variant variantByVoteVariantId;

    @javax.persistence.Column(name = "vote_count")
    @Basic
    public Integer getVoteCount() {
        return voteCount;
    }

    public void setVoteCount(Integer voteCount) {
        this.voteCount = voteCount;
    }

    @javax.persistence.Column(name = "vote_id")
    @Id
    public int getVoteId() {
        return voteId;
    }

    public void setVoteId(int voteId) {
        this.voteId = voteId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Vote vote = (Vote) o;

        if (voteId != vote.voteId) return false;
        if (voteCount != null ? !voteCount.equals(vote.voteCount) : vote.voteCount != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = voteCount != null ? voteCount.hashCode() : 0;
        result = 31 * result + voteId;
        return result;
    }

    @OneToOne
    @javax.persistence.JoinColumn(name = "vote_variant_id", referencedColumnName = "variant_id", nullable = false)
    public Variant getVariantByVoteVariantId() {
        return variantByVoteVariantId;
    }

    public void setVariantByVoteVariantId(Variant variantByVoteVariantId) {
        this.variantByVoteVariantId = variantByVoteVariantId;
    }
}
