(define (domain chain-domain)
  :requirements :strips :typing :negative-preconditions
  :types
    planner sensor mover auditor object
  :predicates
    ;; Agent typing predicates (identifiers for available agents)
    (planner-agent ?p - planner)
    (sensor-agent ?s - sensor)
    (mover-agent ?m - mover)
    (auditor-agent ?a - auditor)

    ;; Structural predicates for the linked sequence of objects
    (next ?x - object ?y - object)                 ; established successor relation
    (free-successor ?x - object)                   ; object currently has no successor
    (free-predecessor ?y - object)                 ; object currently has no predecessor

    ;; Reservation / planning / verification / execution / audit predicates
    (reserved-succ ?x - object)                    ; successor slot reserved by a plan
    (reserved-pred ?y - object)                    ; predecessor slot reserved by a plan
    (planned ?p - planner ?x - object ?y - object) ; planner p planned linking x->y
    (verified ?s - sensor ?x - object ?y - object) ; sensor s verified the planned preconditions
    (linked-by ?m - mover ?x - object ?y - object) ; mover m executed the physical link x->y
    (audited ?a - auditor ?x - object ?y - object) ; auditor a approved the established link

  ;; Actions are separated by agent responsibilities and enforce the required ordering:
  ;;  planner -> sensor -> mover -> auditor. Reservations prevent competing plans.
  (:action planner-plan-link
    :parameters (?p - planner ?x - object ?y - object)
    :precondition (and
                    (planner-agent ?p)
                    (free-successor ?x)
                    (free-predecessor ?y)
                    (not (reserved-succ ?x))
                    (not (reserved-pred ?y))
                  )
    :effect (and
              (planned ?p ?x ?y)
              (reserved-succ ?x)
              (reserved-pred ?y)
            )
  )

  (:action sensor-verify
    :parameters (?s - sensor ?p - planner ?x - object ?y - object)
    :precondition (and
                    (sensor-agent ?s)
                    (planned ?p ?x ?y)
                    (reserved-succ ?x)
                    (reserved-pred ?y)
                  )
    :effect (and
              (verified ?s ?x ?y)
            )
  )

  (:action mover-establish-next
    :parameters (?m - mover ?s - sensor ?p - planner ?x - object ?y - object)
    :precondition (and
                    (mover-agent ?m)
                    ;; requires that a planner planned and a sensor verified for the same pair:
                    (planned ?p ?x ?y)
                    (verified ?s ?x ?y)
                    ;; reserved ensures exclusivity; free flags ensure no current successor/predecessor
                    (reserved-succ ?x)
                    (reserved-pred ?y)
                    (free-successor ?x)
                    (free-predecessor ?y)
                  )
    :effect (and
              ;; establish the structural link
              (next ?x ?y)
              (linked-by ?m ?x ?y)
              ;; consume the free slots since now successor/predecessor exist
              (not (free-successor ?x))
              (not (free-predecessor ?y))
              ;; release reservations (they have been realized)
              (not (reserved-succ ?x))
              (not (reserved-pred ?y))
            )
  )

  (:action auditor-audit
    :parameters (?a - auditor ?m - mover ?x - object ?y - object)
    :precondition (and
                    (auditor-agent ?a)
                    ;; auditor only approves after the mover executed the link
                    (next ?x ?y)
                    (linked-by ?m ?x ?y)
                  )
    :effect (and
              (audited ?a ?x ?y)
            )
  )
)