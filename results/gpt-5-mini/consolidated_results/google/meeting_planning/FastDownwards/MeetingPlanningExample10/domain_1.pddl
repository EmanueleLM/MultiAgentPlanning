(define (domain meeting-planning)
  (:requirements :typing :negative-preconditions :fluents :action-costs)
  (:types location time)

  (:predicates
    (now ?t - time)
    (at ?l - location)
    (next ?t ?t2 - time)
    (james_available ?t ?t2 - time)
    (met_james)
  )

  (:functions
    (total-cost)
  )

  ; Wait action: advance time while staying at same location (generic: used for waiting at GGP in the concrete problem)
  (:action wait
    :parameters (?from - time ?to - time ?loc - location)
    :precondition (and (now ?from) (at ?loc) (next ?from ?to))
    :effect (and (not (now ?from)) (now ?to))
  )

  ; Travel GGP -> Marina (asymmetric duration is enforced by which (next ...) pairs exist in the problem)
  (:action travel-ggp-to-marina
    :parameters (?from - time ?to - time)
    :precondition (and (now ?from) (at golden_gate_park) (next ?from ?to))
    :effect (and
              (not (now ?from)) (now ?to)
              (not (at golden_gate_park)) (at marina_district)
              (increase (total-cost) 16)
            )
  )

  ; Travel Marina -> GGP (included for completeness; not required by selected schedule)
  (:action travel-marina-to-ggp
    :parameters (?from - time ?to - time)
    :precondition (and (now ?from) (at marina_district) (next ?from ?to))
    :effect (and
              (not (now ?from)) (now ?to)
              (not (at marina_district)) (at golden_gate_park)
              (increase (total-cost) 18)
            )
  )

  ; Meet James: requires being at Marina and advancing time by at least 15 minutes.
  ; This action advances time exactly by the corresponding next relation (here used with 15-minute step pairs).
  (:action meet-james
    :parameters (?from - time ?to - time)
    :precondition (and (now ?from) (at marina_district) (next ?from ?to) (james_available ?from ?to))
    :effect (and
              (not (now ?from)) (now ?to)
              (met_james)
            )
  )
)