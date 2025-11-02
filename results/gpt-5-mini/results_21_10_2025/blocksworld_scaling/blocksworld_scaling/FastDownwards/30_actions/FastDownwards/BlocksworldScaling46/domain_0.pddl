(define (domain blocks-multiagent)
  (:requirements :strips)
  (:predicates
    (vowel ?b)
    (consonant ?b)
    (on ?b ?x)
    (ontable ?b)
    (clear ?b)
    (holding-vowel ?b)
    (holding-cons ?b)
    (free-vowel-hand)
    (free-cons-hand)
  )

  ;; Vowel-agent pickup: from table
  (:action pick-vowel-from-table
    :parameters (?b)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (ontable ?b)
      (free-vowel-hand)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (holding-vowel ?b)
      (not (free-vowel-hand))
    )
  )

  ;; Vowel-agent pickup: from another block
  (:action pick-vowel-from-block
    :parameters (?b ?below)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?below)
      (free-vowel-hand)
    )
    :effect (and
      (not (on ?b ?below))
      (clear ?below)
      (not (clear ?b))
      (holding-vowel ?b)
      (not (free-vowel-hand))
    )
  )

  ;; Vowel-agent place: onto table
  (:action place-vowel-on-table
    :parameters (?b)
    :precondition (and
      (holding-vowel ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding-vowel ?b))
      (free-vowel-hand)
    )
  )

  ;; Vowel-agent place: onto another block
  (:action place-vowel-on-block
    :parameters (?b ?below)
    :precondition (and
      (holding-vowel ?b)
      (clear ?below)
    )
    :effect (and
      (on ?b ?below)
      (clear ?b)
      (not (clear ?below))
      (not (holding-vowel ?b))
      (free-vowel-hand)
    )
  )

  ;; Consonant-agent pickup: from table
  (:action pick-cons-from-table
    :parameters (?b)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (ontable ?b)
      (free-cons-hand)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (holding-cons ?b)
      (not (free-cons-hand))
    )
  )

  ;; Consonant-agent pickup: from another block
  (:action pick-cons-from-block
    :parameters (?b ?below)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (on ?b ?below)
      (free-cons-hand)
    )
    :effect (and
      (not (on ?b ?below))
      (clear ?below)
      (not (clear ?b))
      (holding-cons ?b)
      (not (free-cons-hand))
    )
  )

  ;; Consonant-agent place: onto table
  (:action place-cons-on-table
    :parameters (?b)
    :precondition (and
      (holding-cons ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding-cons ?b))
      (free-cons-hand)
    )
  )

  ;; Consonant-agent place: onto another block
  (:action place-cons-on-block
    :parameters (?b ?below)
    :precondition (and
      (holding-cons ?b)
      (clear ?below)
    )
    :effect (and
      (on ?b ?below)
      (clear ?b)
      (not (clear ?below))
      (not (holding-cons ?b))
      (free-cons-hand)
    )
  )

)