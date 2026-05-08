(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (holding ?b - block)
    (clear ?b - block)
    (on ?b1 - block ?b2 - block)
    (ontable ?b - block)
    (handempty)
    (at ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Unstack a block ?x from block ?y, advancing time from ?s1 to its successor ?s2.
  ;; Preconditions:
  ;;  - ?x is on ?y
  ;;  - ?x is clear (nothing on top and not held)
  ;;  - hand is empty
  ;;  - global time is at ?s1 and ?s2 is the immediate successor
  ;; Effects:
  ;;  - ?x becomes held
  ;;  - ?x is no longer on ?y
  ;;  - ?x is no longer clear (because it is held)
  ;;  - ?y becomes clear (since ?x was removed)
  ;;  - hand becomes non-empty; advance global time to ?s2
  (:action unstack-block
    :parameters (?x - block ?y - block ?s1 - stage ?s2 - stage)
    :precondition (and
                    (on ?x ?y)
                    (clear ?x)
                    (handempty)
                    (at ?s1)
                    (next ?s1 ?s2)
                  )
    :effect (and
              (holding ?x)
              (clear ?y)
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handempty))
              (not (at ?s1))
              (at ?s2)
            )
  )

  ;; Stack a held block ?x onto a clear block ?y, advancing time.
  ;; Preconditions:
  ;;  - ?x is being held
  ;;  - ?y is clear
  ;;  - at ?s1 and next ?s1 ?s2
  ;; Effects:
  ;;  - ?x is on ?y
  ;;  - ?y becomes not clear
  ;;  - ?x becomes clear (nothing on top)
  ;;  - ?x is no longer held, hand becomes empty; advance time
  (:action stack-block
    :parameters (?x - block ?y - block ?s1 - stage ?s2 - stage)
    :precondition (and
                    (holding ?x)
                    (clear ?y)
                    (at ?s1)
                    (next ?s1 ?s2)
                  )
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (not (holding ?x))
              (not (clear ?y))
              (handempty)
              (not (ontable ?x))
              (not (at ?s1))
              (at ?s2)
            )
  )

  ;; Pick up a clear block from the table, advancing time.
  ;; Preconditions:
  ;;  - ?x is on the table and clear
  ;;  - hand is empty
  ;;  - at ?s1 and next ?s1 ?s2
  ;; Effects:
  ;;  - ?x becomes held
  ;;  - ?x is no longer on the table and no longer clear
  ;;  - hand becomes non-empty; advance time
  (:action pickup-block
    :parameters (?x - block ?s1 - stage ?s2 - stage)
    :precondition (and
                    (ontable ?x)
                    (clear ?x)
                    (handempty)
                    (at ?s1)
                    (next ?s1 ?s2)
                  )
    :effect (and
              (holding ?x)
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty))
              (not (at ?s1))
              (at ?s2)
            )
  )

  ;; Put down a held block onto the table, advancing time.
  ;; Preconditions:
  ;;  - ?x is being held
  ;;  - at ?s1 and next ?s1 ?s2
  ;; Effects:
  ;;  - ?x is on the table and becomes clear
  ;;  - ?x is no longer held; hand becomes empty; advance time
  (:action putdown-block
    :parameters (?x - block ?s1 - stage ?s2 - stage)
    :precondition (and
                    (holding ?x)
                    (at ?s1)
                    (next ?s1 ?s2)
                  )
    :effect (and
              (ontable ?x)
              (clear ?x)
              (not (holding ?x))
              (handempty)
              (not (at ?s1))
              (at ?s2)
            )
  )
)