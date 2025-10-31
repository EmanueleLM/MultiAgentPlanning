(define (problem blocks-agents-problem)
  (:domain blocks-agents)
  (:objects
    a b c - block
    vowel_ag consonant_ag - agent
  )
  (:init
    ;; Initial stacking:
    ;; c is on a (c above a); a and b are on the table
    (on c a)
    (ontable a)
    (ontable b)

    ;; Top-of-stack facts: c and b have nothing on them
    (top c)
    (top b)

    ;; Both agents start with empty hands
    (handempty vowel_ag)
    (handempty consonant_ag)

    ;; Block types
    (is-vowel a)
    (is-consonant b)
    (is-consonant c)

    ;; Agent roles
    (vowel-agent vowel_ag)
    (consonant-agent consonant_ag)
  )

  ;; Goal: place vowel block a on consonant block b
  (:goal (and
    (on a b)
  ))
)