(define (domain blocks-manipulator)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage object)

  (:predicates
    (on ?b - block ?p - object)    ; block ?b is directly on object ?p (block or table)
    (clear ?b - block)             ; block ?b has nothing on top and is not being held
    (holding ?b - block)           ; manipulator is holding block ?b
    (handempty)                    ; manipulator's hand is empty
    (next ?s - stage ?s2 - stage)  ; successor relation between stages
    (at ?s - stage)                ; global current stage
  )

  ;; Unstack action: remove top block ?x from block ?y, advance stage
  (:action unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
                    (on ?x ?y)
                    (clear ?x)
                    (handempty)
                    (at ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (holding ?x)
              (clear ?y)
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handempty))
              (not (at ?s))
              (at ?s2)
            )
  )

  ;; Stack action: place held block ?x onto block ?y, advance stage
  (:action stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
                    (holding ?x)
                    (clear ?y)
                    (at ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (not (clear ?y))
              (not (holding ?x))
              (handempty)
              (not (at ?s))
              (at ?s2)
            )
  )

  ;; Pickup action from the table: pick block ?x that is on table ?t, advance stage
  (:action pickup
    :parameters (?x - block ?t - object ?s - stage ?s2 - stage)
    :precondition (and
                    (on ?x ?t)
                    (clear ?x)
                    (handempty)
                    (at ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (holding ?x)
              (not (on ?x ?t))
              (not (clear ?x))
              (not (handempty))
              (not (at ?s))
              (at ?s2)
            )
  )

  ;; Putdown action to the table: put held block ?x onto table ?t, advance stage
  (:action putdown
    :parameters (?x - block ?t - object ?s - stage ?s2 - stage)
    :precondition (and
                    (holding ?x)
                    (at ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (on ?x ?t)
              (clear ?x)
              (not (holding ?x))
              (handempty)
              (not (at ?s))
              (at ?s2)
            )
  )
)