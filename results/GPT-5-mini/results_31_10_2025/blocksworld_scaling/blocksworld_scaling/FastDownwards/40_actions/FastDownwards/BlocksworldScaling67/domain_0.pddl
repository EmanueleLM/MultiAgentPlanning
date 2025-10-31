(define (domain blocksworld-multiagent)
  (:requirements :strips :typing)
  (:types block vowel consonant)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (handempty-vowel)
    (handempty-consonant)
  )

  ;; Vowel agent actions
  (:action move-vowel-block-to-block
    :parameters (?v - vowel ?from - block ?to - block)
    :precondition (and (handempty-vowel) (on ?v ?from) (clear ?v) (clear ?to))
    :effect (and
      (not (on ?v ?from))
      (on ?v ?to)
      (clear ?v)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-vowel-table-to-block
    :parameters (?v - vowel ?to - block)
    :precondition (and (handempty-vowel) (ontable ?v) (clear ?v) (clear ?to))
    :effect (and
      (not (ontable ?v))
      (on ?v ?to)
      (clear ?v)
      (not (clear ?to))
    )
  )

  (:action move-vowel-block-to-table
    :parameters (?v - vowel ?from - block)
    :precondition (and (handempty-vowel) (on ?v ?from) (clear ?v))
    :effect (and
      (not (on ?v ?from))
      (ontable ?v)
      (clear ?v)
      (clear ?from)
    )
  )

  ;; Consonant agent actions
  (:action move-consonant-block-to-block
    :parameters (?c - consonant ?from - block ?to - block)
    :precondition (and (handempty-consonant) (on ?c ?from) (clear ?c) (clear ?to))
    :effect (and
      (not (on ?c ?from))
      (on ?c ?to)
      (clear ?c)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-consonant-table-to-block
    :parameters (?c - consonant ?to - block)
    :precondition (and (handempty-consonant) (ontable ?c) (clear ?c) (clear ?to))
    :effect (and
      (not (ontable ?c))
      (on ?c ?to)
      (clear ?c)
      (not (clear ?to))
    )
  )

  (:action move-consonant-block-to-table
    :parameters (?c - consonant ?from - block)
    :precondition (and (handempty-consonant) (on ?c ?from) (clear ?c))
    :effect (and
      (not (on ?c ?from))
      (ontable ?c)
      (clear ?c)
      (clear ?from)
    )
  )
)