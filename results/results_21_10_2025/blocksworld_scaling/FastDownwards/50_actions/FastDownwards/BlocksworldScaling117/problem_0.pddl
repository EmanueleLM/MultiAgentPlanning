(define (problem two-agent-blocks-problem)
  (:domain blocks-two-agents)

  ;; Objects: two vowel-initial blocks (a, e) and two consonant-initial blocks (b, c)
  (:objects
    a e b c - block
  )

  ;; Initial configuration (public information + agents' reports integrated):
  ;; - Block a is on block b (a is top of that stack)
  ;; - Blocks b, c, e are on the table
  ;; - Clear indicates no block on top
  ;; - Vowel/consonant membership encoded as hard constraints (agents may only move permitted blocks)
  (:init
    (on a b)
    (on-table b)
    (on-table c)
    (on-table e)

    (clear a)
    (clear c)
    (clear e)

    (vowel-block a)
    (vowel-block e)
    (consonant-block b)
    (consonant-block c)
  )

  ;; Global goal to be achieved by the two agents acting under their movement restrictions:
  ;; - Place block a on block e (requires vowel-agent moves for 'a')
  ;; - Place block b on block c (requires consonant-agent moves for 'b')
  (:goal (and
           (on a e)
           (on b c)
         )
  )
)