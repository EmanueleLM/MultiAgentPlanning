(define (domain trip-planning)
  (:requirements :typing :fluents :negative-preconditions :equality :conditional-effects)
  (:types city day)
  (:predicates
    (in ?d - day ?c - city)
    (assigned ?d - day)
    (flight ?from - city ?to - city)
    (first ?d - day)
    (next ?d1 - day ?d2 - day)
  )
  (:functions
    (count-oslo)
    (count-porto)
    (count-dubrovnik)
  )

  ;; Assign a city to the first day
  (:action assign-first
    :parameters (?d - day ?c - city)
    :precondition (and (first ?d) (not (assigned ?d)))
    :effect (and
      (assigned ?d)
      (in ?d ?c)
      (when (= ?c oslo) (increase (count-oslo) 1))
      (when (= ?c porto) (increase (count-porto) 1))
      (when (= ?c dubrovnik) (increase (count-dubrovnik) 1))
    )
  )

  ;; Assign same city as previous day (no flight required)
  (:action assign-next-same
    :parameters (?prev - day ?cur - day ?x - city)
    :precondition (and (assigned ?prev) (in ?prev ?x) (next ?prev ?cur) (not (assigned ?cur)))
    :effect (and
      (assigned ?cur)
      (in ?cur ?x)
      (when (= ?x oslo) (increase (count-oslo) 1))
      (when (= ?x porto) (increase (count-porto) 1))
      (when (= ?x dubrovnik) (increase (count-dubrovnik) 1))
    )
  )

  ;; Assign a (possibly) different city from previous day; requires a direct flight from previous city to this city
  (:action assign-next-fly
    :parameters (?prev - day ?cur - day ?x - city ?y - city)
    :precondition (and (assigned ?prev) (in ?prev ?x) (next ?prev ?cur) (not (assigned ?cur)) (flight ?x ?y))
    :effect (and
      (assigned ?cur)
      (in ?cur ?y)
      (when (= ?y oslo) (increase (count-oslo) 1))
      (when (= ?y porto) (increase (count-porto) 1))
      (when (= ?y dubrovnik) (increase (count-dubrovnik) 1))
    )
  )
)