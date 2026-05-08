(define (domain arrange-next-domain)
  :requirements :strips :typing :negative-preconditions
  :types object
  :predicates
    ; Structural relation: object X is immediately followed by object Y
    (next ?x - object ?y - object)
    ; Flags to ensure uniqueness: an object may have at most one successor / predecessor
    (has-successor ?x - object)
    (has-predecessor ?x - object)
    ; Explicit availability of each planner (keeps planner-origin actions distinct)
    (available-plannera)
    (available-plannerb)
  ; Action supplied by planner A to link two objects (creates next relation)
  (:action place-next-by-plannera
    :parameters (?x - object ?y - object)
    :precondition (and
                   (available-plannera)
                   (not (has-successor ?x))
                   (not (has-predecessor ?y))
                   (not (next ?x ?y))
                 )
    :effect (and
              (next ?x ?y)
              (has-successor ?x)
              (has-predecessor ?y)
            )
  )
  ; Action supplied by planner B to link two objects (creates next relation)
  (:action place-next-by-plannerb
    :parameters (?x - object ?y - object)
    :precondition (and
                   (available-plannerb)
                   (not (has-successor ?x))
                   (not (has-predecessor ?y))
                   (not (next ?x ?y))
                 )
    :effect (and
              (next ?x ?y)
              (has-successor ?x)
              (has-predecessor ?y)
            )
  )
)