(define (domain trip-planning)
  (:requirements :typing :negative-preconditions :equality :adl :action-costs)
  (:types city day slot-oslo slot-porto slot-dubrovnik)
  (:predicates
    (in ?d - day ?c - city)
    (assigned ?d - day)
    (flight ?from - city ?to - city)
    (first ?d - day)
    (next ?d1 - day ?d2 - day)
    (available-oslo ?s - slot-oslo)
    (used-oslo ?s - slot-oslo)
    (available-porto ?s - slot-porto)
    (used-porto ?s - slot-porto)
    (available-dubrovnik ?s - slot-dubrovnik)
    (used-dubrovnik ?s - slot-dubrovnik)
  )

  (:action assign-first-oslo
    :parameters (?d - day ?s - slot-oslo)
    :precondition (and (first ?d) (not (assigned ?d)) (available-oslo ?s))
    :effect (and (assigned ?d) (in ?d oslo) (not (available-oslo ?s)) (used-oslo ?s))
    :cost 1
  )

  (:action assign-first-porto
    :parameters (?d - day ?s - slot-porto)
    :precondition (and (first ?d) (not (assigned ?d)) (available-porto ?s))
    :effect (and (assigned ?d) (in ?d porto) (not (available-porto ?s)) (used-porto ?s))
    :cost 1
  )

  (:action assign-first-dubrovnik
    :parameters (?d - day ?s - slot-dubrovnik)
    :precondition (and (first ?d) (not (assigned ?d)) (available-dubrovnik ?s))
    :effect (and (assigned ?d) (in ?d dubrovnik) (not (available-dubrovnik ?s)) (used-dubrovnik ?s))
    :cost 1
  )

  (:action assign-next-same-oslo
    :parameters (?prev - day ?cur - day ?s - slot-oslo)
    :precondition (and (assigned ?prev) (in ?prev oslo) (next ?prev ?cur) (not (assigned ?cur)) (available-oslo ?s))
    :effect (and (assigned ?cur) (in ?cur oslo) (not (available-oslo ?s)) (used-oslo ?s))
    :cost 1
  )

  (:action assign-next-same-porto
    :parameters (?prev - day ?cur - day ?s - slot-porto)
    :precondition (and (assigned ?prev) (in ?prev porto) (next ?prev ?cur) (not (assigned ?cur)) (available-porto ?s))
    :effect (and (assigned ?cur) (in ?cur porto) (not (available-porto ?s)) (used-porto ?s))
    :cost 1
  )

  (:action assign-next-same-dubrovnik
    :parameters (?prev - day ?cur - day ?s - slot-dubrovnik)
    :precondition (and (assigned ?prev) (in ?prev dubrovnik) (next ?prev ?cur) (not (assigned ?cur)) (available-dubrovnik ?s))
    :effect (and (assigned ?cur) (in ?cur dubrovnik) (not (available-dubrovnik ?s)) (used-dubrovnik ?s))
    :cost 1
  )

  (:action assign-next-fly-to-oslo
    :parameters (?prev - day ?cur - day ?x - city ?s - slot-oslo)
    :precondition (and (assigned ?prev) (in ?prev ?x) (next ?prev ?cur) (not (assigned ?cur)) (flight ?x oslo) (available-oslo ?s))
    :effect (and (assigned ?cur) (in ?cur oslo) (not (available-oslo ?s)) (used-oslo ?s))
    :cost 1
  )

  (:action assign-next-fly-to-porto
    :parameters (?prev - day ?cur - day ?x - city ?s - slot-porto)
    :precondition (and (assigned ?prev) (in ?prev ?x) (next ?prev ?cur) (not (assigned ?cur)) (flight ?x porto) (available-porto ?s))
    :effect (and (assigned ?cur) (in ?cur porto) (not (available-porto ?s)) (used-porto ?s))
    :cost 1
  )

  (:action assign-next-fly-to-dubrovnik
    :parameters (?prev - day ?cur - day ?x - city ?s - slot-dubrovnik)
    :precondition (and (assigned ?prev) (in ?prev ?x) (next ?prev ?cur) (not (assigned ?cur)) (flight ?x dubrovnik) (available-dubrovnik ?s))
    :effect (and (assigned ?cur) (in ?cur dubrovnik) (not (available-dubrovnik ?s)) (used-dubrovnik ?s))
    :cost 1
  )
)