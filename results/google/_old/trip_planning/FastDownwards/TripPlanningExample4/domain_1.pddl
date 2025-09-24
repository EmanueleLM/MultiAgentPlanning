(define (domain orchestrator_combined)
  (:requirements :typing :adl :negative-preconditions :action-costs)
  (:types city day num)

  (:predicates
    (flight ?from - city ?to - city)
    (in ?c - city ?d - day)
    (succ ?d1 - day ?d2 - day)
    (allowed-meet ?d - day)
    (met ?d - day)
    (seville-count ?n - num)
    (munich-count ?n - num)
  )

  (:functions (total-cost))

  ;; Tallinn agent actions
  (:action tallinn-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (flight ?from ?to) (in ?from ?d1) (succ ?d1 ?d2))
    :effect (and
              (not (in ?from ?d1))
              (in ?to ?d2)
              (increase (total-cost) 1)
            )
  )

  (:action tallinn-stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (in ?c ?d1) (succ ?d1 ?d2))
    :effect (and
              (not (in ?c ?d1))
              (in ?c ?d2)
              (increase (total-cost) 1)
            )
  )

  (:action tallinn-meet
    :parameters (?d - day)
    :precondition (and (in tallinn ?d) (allowed-meet ?d))
    :effect (and
              (met ?d)
              (increase (total-cost) 1)
            )
  )

  ;; Seville agent actions
  (:action seville-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (flight ?from ?to) (in ?from ?d1) (succ ?d1 ?d2))
    :effect (and
              (not (in ?from ?d1))
              (in ?to ?d2)
              (increase (total-cost) 1)
            )
  )

  (:action stay-seville
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (in seville ?d1) (succ ?d1 ?d2))
    :effect (and
              (not (in seville ?d1))
              (in seville ?d2)
              ;; increment seville-count: n0->n1, n1->n2, ..., n11->n12
              (when (seville-count n0) (and (not (seville-count n0)) (seville-count n1)))
              (when (seville-count n1) (and (not (seville-count n1)) (seville-count n2)))
              (when (seville-count n2) (and (not (seville-count n2)) (seville-count n3)))
              (when (seville-count n3) (and (not (seville-count n3)) (seville-count n4)))
              (when (seville-count n4) (and (not (seville-count n4)) (seville-count n5)))
              (when (seville-count n5) (and (not (seville-count n5)) (seville-count n6)))
              (when (seville-count n6) (and (not (seville-count n6)) (seville-count n7)))
              (when (seville-count n7) (and (not (seville-count n7)) (seville-count n8)))
              (when (seville-count n8) (and (not (seville-count n8)) (seville-count n9)))
              (when (seville-count n9) (and (not (seville-count n9)) (seville-count n10)))
              (when (seville-count n10) (and (not (seville-count n10)) (seville-count n11)))
              (when (seville-count n11) (and (not (seville-count n11)) (seville-count n12)))
              (increase (total-cost) 1)
            )
  )

  ;; Munich agent actions
  (:action munich-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (flight ?from ?to) (in ?from ?d1) (succ ?d1 ?d2))
    :effect (and
              (not (in ?from ?d1))
              (in ?to ?d2)
              (increase (total-cost) 1)
            )
  )

  (:action munich-stay-one-day
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (in munich ?d1) (succ ?d1 ?d2))
    :effect (and
              (not (in munich ?d1))
              (in munich ?d2)
              ;; increment munich-count: n0->n1, n1->n2, ..., n11->n12
              (when (munich-count n0) (and (not (munich-count n0)) (munich-count n1)))
              (when (munich-count n1) (and (not (munich-count n1)) (munich-count n2)))
              (when (munich-count n2) (and (not (munich-count n2)) (munich-count n3)))
              (when (munich-count n3) (and (not (munich-count n3)) (munich-count n4)))
              (when (munich-count n4) (and (not (munich-count n4)) (munich-count n5)))
              (when (munich-count n5) (and (not (munich-count n5)) (munich-count n6)))
              (when (munich-count n6) (and (not (munich-count n6)) (munich-count n7)))
              (when (munich-count n7) (and (not (munich-count n7)) (munich-count n8)))
              (when (munich-count n8) (and (not (munich-count n8)) (munich-count n9)))
              (when (munich-count n9) (and (not (munich-count n9)) (munich-count n10)))
              (when (munich-count n10) (and (not (munich-count n10)) (munich-count n11)))
              (when (munich-count n11) (and (not (munich-count n11)) (munich-count n12)))
              (increase (total-cost) 1)
            )
  )
)