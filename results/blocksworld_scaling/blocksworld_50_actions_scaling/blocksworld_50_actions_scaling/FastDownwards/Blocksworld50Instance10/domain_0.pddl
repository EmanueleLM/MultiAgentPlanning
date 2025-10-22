(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block place robot - object)

  (:predicates
    (on ?b - block ?x - object)        ; block b is on object x (block or place)
    (clear ?x - object)               ; object x has nothing on it (meaningful for blocks)
    (holding ?r - robot ?b - block)   ; robot r is holding block b
    (handempty ?r - robot)            ; robot r's gripper is empty
  )

  ;======== Actions for robot r1 ========
  (:action pick-up-r1
    :parameters (?b - block ?t - place)
    :precondition (and (on ?b ?t) (clear ?b) (handempty r1))
    :effect (and
              (not (on ?b ?t))
              (not (handempty r1))
              (holding r1 ?b)
              (not (clear ?b))
            )
  )

  (:action unstack-r1
    :parameters (?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty r1))
    :effect (and
              (not (on ?b ?c))
              (holding r1 ?b)
              (not (handempty r1))
              (clear ?c)
              (not (clear ?b))
            )
  )

  (:action put-down-r1
    :parameters (?b - block ?t - place)
    :precondition (holding r1 ?b)
    :effect (and
              (not (holding r1 ?b))
              (on ?b ?t)
              (handempty r1)
              (clear ?b)
            )
  )

  (:action stack-r1
    :parameters (?b - block ?c - block)
    :precondition (and (holding r1 ?b) (clear ?c))
    :effect (and
              (not (holding r1 ?b))
              (on ?b ?c)
              (handempty r1)
              (not (clear ?c))
              (clear ?b)
            )
  )

  ;======== Actions for robot r2 ========
  (:action pick-up-r2
    :parameters (?b - block ?t - place)
    :precondition (and (on ?b ?t) (clear ?b) (handempty r2))
    :effect (and
              (not (on ?b ?t))
              (not (handempty r2))
              (holding r2 ?b)
              (not (clear ?b))
            )
  )

  (:action unstack-r2
    :parameters (?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty r2))
    :effect (and
              (not (on ?b ?c))
              (holding r2 ?b)
              (not (handempty r2))
              (clear ?c)
              (not (clear ?b))
            )
  )

  (:action put-down-r2
    :parameters (?b - block ?t - place)
    :precondition (holding r2 ?b)
    :effect (and
              (not (holding r2 ?b))
              (on ?b ?t)
              (handempty r2)
              (clear ?b)
            )
  )

  (:action stack-r2
    :parameters (?b - block ?c - block)
    :precondition (and (holding r2 ?b) (clear ?c))
    :effect (and
              (not (holding r2 ?b))
              (on ?b ?c)
              (handempty r2)
              (not (clear ?c))
              (clear ?b)
            )
  )
)