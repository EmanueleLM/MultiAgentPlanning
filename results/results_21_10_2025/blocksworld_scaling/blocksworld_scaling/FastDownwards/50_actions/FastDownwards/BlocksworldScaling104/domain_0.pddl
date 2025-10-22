(define (domain blocksworld-agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)                      ; nothing on ?x (i.e. ?x is a top)
    (handempty)                             ; no block is being held
    (holding-vowel ?x - block)
    (holding-consonant ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ; Vowel-agent actions
  (:action pick-vowel-from-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (holding-vowel ?b)
      (not (ontable ?b))
      (not (handempty))
      (not (clear ?b))
    )
  )

  (:action pick-vowel-from-block
    :parameters (?b - block ?s - block)
    :precondition (and (vowel ?b) (on ?b ?s) (clear ?b) (handempty))
    :effect (and
      (holding-vowel ?b)
      (clear ?s)
      (not (on ?b ?s))
      (not (handempty))
      (not (clear ?b))
    )
  )

  (:action place-vowel-on-table
    :parameters (?b - block)
    :precondition (and (holding-vowel ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding-vowel ?b))
    )
  )

  (:action place-vowel-on-block
    :parameters (?b - block ?t - block)
    :precondition (and (holding-vowel ?b) (clear ?t) (not (= ?b ?t)))
    :effect (and
      (on ?b ?t)
      (clear ?b)
      (not (clear ?t))
      (handempty)
      (not (holding-vowel ?b))
    )
  )

  ; Consonant-agent actions
  (:action pick-consonant-from-table
    :parameters (?b - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (holding-consonant ?b)
      (not (ontable ?b))
      (not (handempty))
      (not (clear ?b))
    )
  )

  (:action pick-consonant-from-block
    :parameters (?b - block ?s - block)
    :precondition (and (consonant ?b) (on ?b ?s) (clear ?b) (handempty))
    :effect (and
      (holding-consonant ?b)
      (clear ?s)
      (not (on ?b ?s))
      (not (handempty))
      (not (clear ?b))
    )
  )

  (:action place-consonant-on-table
    :parameters (?b - block)
    :precondition (and (holding-consonant ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding-consonant ?b))
    )
  )

  (:action place-consonant-on-block
    :parameters (?b - block ?t - block)
    :precondition (and (holding-consonant ?b) (clear ?t) (not (= ?b ?t)))
    :effect (and
      (on ?b ?t)
      (clear ?b)
      (not (clear ?t))
      (handempty)
      (not (holding-consonant ?b))
    )
  )
)