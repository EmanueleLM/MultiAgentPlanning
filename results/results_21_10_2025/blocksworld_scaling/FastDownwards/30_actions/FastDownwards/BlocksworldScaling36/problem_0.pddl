(define (problem stack-all-with-J-bottom-A-top)
  (:domain blocks-agents)

  ;;; Assumptions (conservative) made because agent reports / public info were partial:
  ;;; 1) Only two blocks are present: A (a vowel) and J (a consonant). This is the minimal
  ;;;    instance that satisfies "stacking all blocks into one tower with J on the table and A on top."
  ;;; 2) Both blocks start on the table and are clear (no other blocks exist to be tracked).
  ;;; 3) Both agents are available; vowel_agent acts only on blocks marked (vowel ?x),
  ;;;    consonant_agent acts only on blocks marked (consonant ?x). This is enforced in the domain.
  ;;; 4) Natural-language preferences were treated as hard constraints; none were present beyond
  ;;;    the agent-type restriction and final tower ordering.
  ;;; If additional blocks or different initial placements are required by unseen reports,
  ;;; the problem file must be expanded accordingly.

  (:objects
    A J - block
  )

  (:init
    ;; blocks on table initially
    (ontable A)
    (ontable J)

    ;; both blocks are clear initially
    (clear A)
    (clear J)

    ;; world is free (no block held)
    (handempty)

    ;; typing of blocks for agent permissions
    (vowel A)
    (consonant J)
  )

  (:goal (and
    ;; J must be the base on the table
    (ontable J)
    ;; A must be on top of the tower, directly on J (since only two blocks exist)
    (on A J)
    ;; top block should be clear
    (clear A)
    ;; both agents not holding anything at the end (ensures actions finish cleanly)
    (handempty)
  ))
)