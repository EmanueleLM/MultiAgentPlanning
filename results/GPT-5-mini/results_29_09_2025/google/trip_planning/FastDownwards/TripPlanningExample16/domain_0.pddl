(define (domain trip_domain)
  (:requirements :strips)
  (:predicates
    (at ?city ?day)                    ; presence in a city on a given day
    (next ?d1 ?d2)                     ; d2 is the day after d1
    (direct_flight ?from ?to)          ; direct flight available between cities
    (workshop-attended)                ; workshop has been attended
  )

  ; Prague responsibilities: staying in Prague and flying from Prague to Vienna
  (:action prague_stay
    :parameters (?d1 ?d2)
    :precondition (and (at prague ?d1) (next ?d1 ?d2))
    :effect (and (at prague ?d2))
  )

  (:action prague_fly_to_vienna
    :parameters (?d1 ?d2)
    :precondition (and (at prague ?d1) (next ?d1 ?d2) (direct_flight prague vienna))
    :effect (and (at vienna ?d2) (not (at prague ?d2)))
  )

  ; Vienna responsibilities: staying in Vienna and flights to/from Prague and Porto
  (:action vienna_stay
    :parameters (?d1 ?d2)
    :precondition (and (at vienna ?d1) (next ?d1 ?d2))
    :effect (and (at vienna ?d2))
  )

  (:action vienna_fly_to_prague
    :parameters (?d1 ?d2)
    :precondition (and (at vienna ?d1) (next ?d1 ?d2) (direct_flight vienna prague))
    :effect (and (at prague ?d2) (not (at vienna ?d2)))
  )

  (:action vienna_fly_to_porto
    :parameters (?d1 ?d2)
    :precondition (and (at vienna ?d1) (next ?d1 ?d2) (direct_flight vienna porto))
    :effect (and (at porto ?d2) (not (at vienna ?d2)))
  )

  ; Porto responsibilities: staying in Porto and flights from Porto to Vienna
  (:action porto_stay
    :parameters (?d1 ?d2)
    :precondition (and (at porto ?d1) (next ?d1 ?d2))
    :effect (and (at porto ?d2))
  )

  (:action porto_fly_to_vienna
    :parameters (?d1 ?d2)
    :precondition (and (at porto ?d1) (next ?d1 ?d2) (direct_flight porto vienna))
    :effect (and (at vienna ?d2) (not (at porto ?d2)))
  )

  ; Workshop attendance actions (explicit actions for each allowed workshop day)
  (:action attend_workshop_prague_d1
    :parameters ()
    :precondition (and (at prague d1))
    :effect (and (workshop-attended))
  )

  (:action attend_workshop_prague_d2
    :parameters ()
    :precondition (and (at prague d2))
    :effect (and (workshop-attended))
  )

  (:action attend_workshop_prague_d3
    :parameters ()
    :precondition (and (at prague d3))
    :effect (and (workshop-attended))
  )
)