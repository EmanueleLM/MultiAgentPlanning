(define (problem build-A-on-O)
  (:domain multiagent-blocks)
  (:objects
    A O - block
  )

  (:init
    ;; Initial physical configuration: both blocks are on the table and clear.
    (ontable A)
    (ontable O)
    (clear A)
    (clear O)

    ;; Label predicates according to the agents' allowed touches:
    ;; Both A and O are vowels (per the user goal labels). No consonant-labeled blocks exist.
    (vowel A)
    (vowel O)
    ;; (consonant ...) intentionally absent for all blocks; consonant-agent has no applicable moves.

  )

  (:goal (and
           (on A O)      ; A on O
           (ontable O)   ; O on the table
         ))
)