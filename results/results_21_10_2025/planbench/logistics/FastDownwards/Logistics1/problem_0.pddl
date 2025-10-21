(define (problem orchestrated-problem)
  (:domain orchestrated-domain)
  (:objects
    alice bob - agent
    paper book clipA - item
    cup1 - container
    drink1 - item
    memo1 - memo
  )

  (:init
    ;; usability
    (usable paper)
    (usable book)
    (usable clipA)
    (usable memo1)

    ;; drink / container state
    (contains cup1 drink1)

    ;; agent states
    (thirsty alice)
    ;; bob starts not tight and not remembered (absence of predicates)
  )

  ;; Combined goals (both planners' goals integrated)
  (:goal (and
           (small paper)            ; paltry applied to paper
           (sated alice)            ; alice has sipped and is sated
           (clipped paper clipA)    ; paper clipped to clipA
           (wretched book)          ; book has been made wretched
           (remembered bob memo1)   ; bob remembers memo1
           (tight bob)              ; bob becomes tightfisted
         )
  )
)