(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding-vowel ?x - block)
    (holding-consonant ?x - block)
    (handempty-vowel)
    (handempty-consonant)
    (can-vowel ?x - block)
    (can-consonant ?x - block)
  )

  ;; Vowel-agent actions (can move only blocks marked can-vowel)
  (:action vowel-pick-up-from-table
    :parameters (?b - block)
    :precondition (and (on-table ?b) (clear ?b) (handempty-vowel) (can-vowel ?b))
    :effect (and
               (not (on-table ?b))
               (not (clear ?b))
               (holding-vowel ?b)
               (not (handempty-vowel))
            )
  )

  (:action vowel-pick-up-from-block
    :parameters (?b - block ?s - block)
    :precondition (and (on ?b ?s) (clear ?b) (handempty-vowel) (can-vowel ?b))
    :effect (and
              (not (on ?b ?s))
              (not (clear ?b))
              (holding-vowel ?b)
              (not (handempty-vowel))
              (clear ?s)
            )
  )

  (:action vowel-put-down-on-block
    :parameters (?b - block ?t - block)
    :precondition (and (holding-vowel ?b) (clear ?t) (can-vowel ?b))
    :effect (and
              (not (holding-vowel ?b))
              (not (clear ?t))
              (on ?b ?t)
              (clear ?b)
              (handempty-vowel)
            )
  )

  (:action vowel-put-down-on-table
    :parameters (?b - block)
    :precondition (and (holding-vowel ?b) (can-vowel ?b))
    :effect (and
              (not (holding-vowel ?b))
              (on-table ?b)
              (clear ?b)
              (handempty-vowel)
            )
  )

  ;; Consonant-agent actions (can move only blocks marked can-consonant)
  (:action consonant-pick-up-from-table
    :parameters (?b - block)
    :precondition (and (on-table ?b) (clear ?b) (handempty-consonant) (can-consonant ?b))
    :effect (and
               (not (on-table ?b))
               (not (clear ?b))
               (holding-consonant ?b)
               (not (handempty-consonant))
            )
  )

  (:action consonant-pick-up-from-block
    :parameters (?b - block ?s - block)
    :precondition (and (on ?b ?s) (clear ?b) (handempty-consonant) (can-consonant ?b))
    :effect (and
              (not (on ?b ?s))
              (not (clear ?b))
              (holding-consonant ?b)
              (not (handempty-consonant))
              (clear ?s)
            )
  )

  (:action consonant-put-down-on-block
    :parameters (?b - block ?t - block)
    :precondition (and (holding-consonant ?b) (clear ?t) (can-consonant ?b))
    :effect (and
              (not (holding-consonant ?b))
              (not (clear ?t))
              (on ?b ?t)
              (clear ?b)
              (handempty-consonant)
            )
  )

  (:action consonant-put-down-on-table
    :parameters (?b - block)
    :precondition (and (holding-consonant ?b) (can-consonant ?b))
    :effect (and
              (not (holding-consonant ?b))
              (on-table ?b)
              (clear ?b)
              (handempty-consonant)
            )
  )
)