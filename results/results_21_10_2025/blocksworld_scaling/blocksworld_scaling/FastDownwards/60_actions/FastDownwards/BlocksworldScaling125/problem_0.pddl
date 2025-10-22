(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)

  (:objects
    ;; blocks
    blk_g blk_e blk_b blk_a blk_d blk_j blk_f blk_c blk_h blk_i - block
    ;; table positions (two currently occupied, one empty)
    tblpos1 tblpos2 tblpos3 - tablepos
  )

  (:init
    ;; type membership implied by :objects / :types; declare initial on-relations describing two stacks
    ;; Stack1 (bottom->top): G, J, C  => G on tblpos1, J on G, C on J
    (on blk_g tblpos1)
    (on blk_j blk_g)
    (on blk_c blk_j)

    ;; Stack2 (bottom->top): E, B, A, D, F, H, I => E on tblpos2, B on E, A on B, D on A, F on D, H on F, I on H
    (on blk_e tblpos2)
    (on blk_b blk_e)
    (on blk_a blk_b)
    (on blk_d blk_a)
    (on blk_f blk_d)
    (on blk_h blk_f)
    (on blk_i blk_h)

    ;; clear = top blocks and empty table positions
    (clear blk_c)
    (clear blk_i)
    (clear tblpos3)

    ;; vowel/consonant classification (agents' allowed block sets)
    (is-vowel blk_a)
    (is-vowel blk_e)
    (is-vowel blk_i)

    (is-consonant blk_g)
    (is-consonant blk_b)
    (is-consonant blk_d)
    (is-consonant blk_j)
    (is-consonant blk_f)
    (is-consonant blk_c)
    (is-consonant blk_h)
  )

  ;; Goal: single tower bottom-to-top: J on table, I on J, H on I, G on H, F on G, E on F, D on E, C on D, B on C, A on B.
  ;; We select tblpos1 as the table position for the final tower base (J on tblpos1).
  (:goal (and
    (on blk_j tblpos1)
    (on blk_i blk_j)
    (on blk_h blk_i)
    (on blk_g blk_h)
    (on blk_f blk_g)
    (on blk_e blk_f)
    (on blk_d blk_e)
    (on blk_c blk_d)
    (on blk_b blk_c)
    (on blk_a blk_b)
  ))
)