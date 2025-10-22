(define (problem assemble-vowels)
  (:domain blocksworld-multiagent)
  (:objects
    A E I O U - block
    t1 t2 t3 t4 t5 t6 t7 - tablepos
  )

  (:init
    ;; Vowel classification (no consonants declared in this instance)
    (vowel A) (vowel E) (vowel I) (vowel O) (vowel U)

    ;; Initial stack/map: each vowel currently on its own table position (top -> bottom is trivial here)
    (ontable A t1)
    (ontable E t2)
    (ontable I t3)
    (ontable O t4)
    (ontable U t5)

    ;; All blocks are initially clear (no block on top)
    (clear-block A) (clear-block E) (clear-block I) (clear-block O) (clear-block U)

    ;; Provide extra free table positions to allow temporary placements
    (clear-pos t6)
    (clear-pos t7)
  )

  ;; Global goal (explicit): assemble a single vowel-only stack with A on top, then E, then I, then O, and U at the base on table position t1.
  ;; This goal uses only the provided vowel blocks and requires only vowel-agent moves (consonant-agent not required here).
  (:goal (and
           (on A E)
           (on E I)
           (on I O)
           (on O U)
           (ontable U t1)
         ))
)