(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    ;; block classification
    (vowel ?b - block)
    (consonant ?b - block)

    ;; location relations
    (on ?b - block ?s - block)    ; block ?b is directly on top of block ?s
    (ontable ?b - block)          ; block ?b is directly on the table

    ;; stack/top status
    (top ?b - block)              ; ?b is the top block of its stack (nothing on it)
  )

  ;; Vowel agent actions (can move only vowel-labelled blocks A,E,I)
  (:action vowel-move-from-block-to-block
    :parameters (?b - block ?s - block ?dest - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?s)
      (top ?b)
      (top ?dest)
      (not (= ?b ?dest))
    )
    :effect (and
      (not (on ?b ?s))
      (on ?b ?dest)
      (not (top ?dest))
      (top ?s)
      (top ?b)
    )
  )

  (:action vowel-move-from-block-to-table
    :parameters (?b - block ?s - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?s)
      (top ?b)
    )
    :effect (and
      (not (on ?b ?s))
      (ontable ?b)
      (top ?s)
      (top ?b)
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?b - block ?dest - block)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (top ?b)
      (top ?dest)
      (not (= ?b ?dest))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?dest)
      (not (top ?dest))
      (top ?b)
    )
  )

  ;; Consonant agent actions (may move only consonant-labelled blocks)
  (:action consonant-move-from-block-to-block
    :parameters (?b - block ?s - block ?dest - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?s)
      (top ?b)
      (top ?dest)
      (not (= ?b ?dest))
    )
    :effect (and
      (not (on ?b ?s))
      (on ?b ?dest)
      (not (top ?dest))
      (top ?s)
      (top ?b)
    )
  )

  (:action consonant-move-from-block-to-table
    :parameters (?b - block ?s - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?s)
      (top ?b)
    )
    :effect (and
      (not (on ?b ?s))
      (ontable ?b)
      (top ?s)
      (top ?b)
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?b - block ?dest - block)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (top ?b)
      (top ?dest)
      (not (= ?b ?dest))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?dest)
      (not (top ?dest))
      (top ?b)
    )
  )
)