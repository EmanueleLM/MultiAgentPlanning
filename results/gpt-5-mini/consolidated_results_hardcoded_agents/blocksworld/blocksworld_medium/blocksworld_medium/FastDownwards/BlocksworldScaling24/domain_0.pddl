(define (domain blocks-multiagent-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types block phase)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (handempty)
    (holding ?x - block)
    (current-phase ?p - phase)
    (allowed ?x - block ?y - block ?p - phase)
    (next ?p - phase ?q - phase)
  )

  ;; Operator pickup (agent-distinct naming)
  (:action operator_pickup
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
              (holding ?x)
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty))
            )
  )

  ;; Assistant pickup (distinct action name for another agent)
  (:action assistant_pickup
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
              (holding ?x)
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty))
            )
  )

  ;; Operator putdown
  (:action operator_putdown
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handempty)
              (not (holding ?x))
            )
  )

  ;; Assistant putdown
  (:action assistant_putdown
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handempty)
              (not (holding ?x))
            )
  )

  ;; Operator stack action: enforces allowed pairs and phase ordering via explicit phase objects and next links.
  (:action operator_stack
    :parameters (?x - block ?y - block ?p - phase ?q - phase)
    :precondition (and
                    (holding ?x)
                    (clear ?y)
                    (allowed ?x ?y ?p)
                    (current-phase ?p)
                    (next ?p ?q)
                  )
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (handempty)
              (not (clear ?y))
              (not (holding ?x))
              (not (current-phase ?p))
              (current-phase ?q)
            )
  )

  ;; Assistant stack action (distinct name) with identical semantics.
  (:action assistant_stack
    :parameters (?x - block ?y - block ?p - phase ?q - phase)
    :precondition (and
                    (holding ?x)
                    (clear ?y)
                    (allowed ?x ?y ?p)
                    (current-phase ?p)
                    (next ?p ?q)
                  )
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (handempty)
              (not (clear ?y))
              (not (holding ?x))
              (not (current-phase ?p))
              (current-phase ?q)
            )
  )
)