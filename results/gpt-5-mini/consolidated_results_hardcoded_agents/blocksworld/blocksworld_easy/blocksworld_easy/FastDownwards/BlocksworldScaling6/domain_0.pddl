(define (domain blocks-manipulator)
  (:requirements :strips :typing :negative-preconditions)
  (:types object block)

  ;; Predicates
  ;; on ?b ?p : block ?b is directly on object ?p (another block or the table)
  ;; clear ?b : block ?b has nothing on top and is not being held
  ;; holding ?b : block ?b is currently held by the manipulator
  ;; handempty : the manipulator's (single) hand is empty
  (:predicates
    (on ?b - block ?p - object)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Manipulator action schemas
  ; All actions belong to the single manipulator agent (commented below).
  ; These actions enforce the single-hand constraint by requiring handempty
  ; for pick/unstack and providing handempty as an effect of placing actions.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; Unstack action (manipulator)
  ; Precondition: the top block ?x is on another block ?y, ?x is clear, hand is empty
  ; Effect: remove the on relation, manipulator holds ?x, lower block ?y becomes clear,
  ;         ?x is no longer clear, and the hand is no longer empty.
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and
                    (on ?x ?y)
                    (clear ?x)
                    (handempty)
                  )
    :effect (and
              (holding ?x)
              (clear ?y)
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handempty))
            )
  )

  ; Stack action (manipulator)
  ; Precondition: manipulator is holding ?x and target block ?y is clear
  ; Effect: place ?x on ?y, ?x becomes clear (has nothing on top and is not held),
  ;         target ?y becomes not clear, manipulator no longer holds ?x, hand empty.
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and
                    (holding ?x)
                    (clear ?y)
                  )
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (not (clear ?y))
              (not (holding ?x))
              (handempty)
            )
  )

  ; Pick-up action from the table (manipulator)
  ; Precondition: ?x is on the table, ?x is clear, hand is empty
  ; Effect: manipulator holds ?x, remove on(... table), ?x not clear, hand not empty
  (:action pickup
    :parameters (?x - block ?t - object) ; ?t should be the table object in the problem
    :precondition (and
                    (on ?x ?t)
                    (clear ?x)
                    (handempty)
                  )
    :effect (and
              (holding ?x)
              (not (on ?x ?t))
              (not (clear ?x))
              (not (handempty))
            )
  )

  ; Put-down action to the table (manipulator)
  ; Precondition: manipulator is holding ?x
  ; Effect: place ?x on the table, ?x becomes clear, manipulator releases ?x, hand empty
  (:action putdown
    :parameters (?x - block ?t - object)
    :precondition (and
                    (holding ?x)
                  )
    :effect (and
              (on ?x ?t)
              (clear ?x)
              (not (holding ?x))
              (handempty)
            )
  )
)