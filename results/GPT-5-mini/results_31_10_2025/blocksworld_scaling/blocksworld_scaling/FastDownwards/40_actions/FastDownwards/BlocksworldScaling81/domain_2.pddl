(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types vowel consonant - block)
  (:predicates
    (on ?b - block ?under - block)
    (ontable ?b - block)
    (clear ?b - block)
  )

  ;; Vowel-agent actions (only vowels may be moved by these actions)

  ;; Move a vowel from on top of some block ?under to the table
  (:action vowel-move-from-block-to-table
    :parameters (?v - vowel ?under - block)
    :precondition (and (clear ?v) (on ?v ?under))
    :effect (and
      (ontable ?v)
      (clear ?under)
      (not (on ?v ?under))
      (clear ?v)
    )
  )

  ;; Move a vowel from the table onto a clear block ?x
  (:action vowel-move-from-table-onto-block
    :parameters (?v - vowel ?x - block)
    :precondition (and (clear ?v) (ontable ?v) (clear ?x))
    :effect (and
      (on ?v ?x)
      (not (ontable ?v))
      (not (clear ?x))
      (clear ?v)
    )
  )

  ;; Move a vowel from on top of ?under onto a clear block ?x
  (:action vowel-move-from-block-onto-block
    :parameters (?v - vowel ?under - block ?x - block)
    :precondition (and (clear ?v) (on ?v ?under) (clear ?x))
    :effect (and
      (on ?v ?x)
      (clear ?under)
      (not (on ?v ?under))
      (not (clear ?x))
      (clear ?v)
    )
  )

  ;; Consonant-agent actions (only consonants may be moved by these actions)

  ;; Move a consonant from on top of some block ?under to the table
  (:action consonant-move-from-block-to-table
    :parameters (?c - consonant ?under - block)
    :precondition (and (clear ?c) (on ?c ?under))
    :effect (and
      (ontable ?c)
      (clear ?under)
      (not (on ?c ?under))
      (clear ?c)
    )
  )

  ;; Move a consonant from the table onto a clear block ?x
  (:action consonant-move-from-table-onto-block
    :parameters (?c - consonant ?x - block)
    :precondition (and (clear ?c) (ontable ?c) (clear ?x))
    :effect (and
      (on ?c ?x)
      (not (ontable ?c))
      (not (clear ?x))
      (clear ?c)
    )
  )

  ;; Move a consonant from on top of ?under onto a clear block ?x
  (:action consonant-move-from-block-onto-block
    :parameters (?c - consonant ?under - block ?x - block)
    :precondition (and (clear ?c) (on ?c ?under) (clear ?x))
    :effect (and
      (on ?c ?x)
      (clear ?under)
      (not (on ?c ?under))
      (not (clear ?x))
      (clear ?c)
    )
  )
)