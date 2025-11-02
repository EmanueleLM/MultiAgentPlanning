(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block place robot - object)

  (:predicates
    (on ?b - block ?x - object)        ; block b is on object x (block or place)
    (clear ?x - object)               ; object x has nothing on it
    (holding ?r - robot ?b - block)   ; robot r is holding block b
    (handempty ?r - robot)            ; robot r's gripper is empty
  )

  ;======== Actions for robot_1 ========
  (:action pickup-robot_1
    :parameters (?b - block ?t - place)
    :precondition (and (on ?b ?t) (clear ?b) (handempty robot_1))
    :effect (and
              (not (on ?b ?t))
              (not (handempty robot_1))
              (holding robot_1 ?b)
              (not (clear ?b))
            )
  )

  (:action unstack-robot_1
    :parameters (?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty robot_1))
    :effect (and
              (not (on ?b ?c))
              (holding robot_1 ?b)
              (not (handempty robot_1))
              (clear ?c)
              (not (clear ?b))
            )
  )

  (:action putdown-robot_1
    :parameters (?b - block ?t - place)
    :precondition (holding robot_1 ?b)
    :effect (and
              (not (holding robot_1 ?b))
              (on ?b ?t)
              (handempty robot_1)
              (clear ?b)
            )
  )

  (:action stack-robot_1
    :parameters (?b - block ?c - block)
    :precondition (and (holding robot_1 ?b) (clear ?c))
    :effect (and
              (not (holding robot_1 ?b))
              (on ?b ?c)
              (handempty robot_1)
              (not (clear ?c))
              (clear ?b)
            )
  )

  ;======== Actions for robot_2 ========
  (:action pickup-robot_2
    :parameters (?b - block ?t - place)
    :precondition (and (on ?b ?t) (clear ?b) (handempty robot_2))
    :effect (and
              (not (on ?b ?t))
              (not (handempty robot_2))
              (holding robot_2 ?b)
              (not (clear ?b))
            )
  )

  (:action unstack-robot_2
    :parameters (?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty robot_2))
    :effect (and
              (not (on ?b ?c))
              (holding robot_2 ?b)
              (not (handempty robot_2))
              (clear ?c)
              (not (clear ?b))
            )
  )

  (:action putdown-robot_2
    :parameters (?b - block ?t - place)
    :precondition (holding robot_2 ?b)
    :effect (and
              (not (holding robot_2 ?b))
              (on ?b ?t)
              (handempty robot_2)
              (clear ?b)
            )
  )

  (:action stack-robot_2
    :parameters (?b - block ?c - block)
    :precondition (and (holding robot_2 ?b) (clear ?c))
    :effect (and
              (not (holding robot_2 ?b))
              (on ?b ?c)
              (handempty robot_2)
              (not (clear ?c))
              (clear ?b)
            )
  )
)