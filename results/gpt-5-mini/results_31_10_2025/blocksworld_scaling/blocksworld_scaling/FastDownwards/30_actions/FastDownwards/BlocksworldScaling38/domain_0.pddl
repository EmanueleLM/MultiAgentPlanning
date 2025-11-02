(define (domain two-agent-blocks)
  (:requirements :strips :typing)
  (:types block vowel consonant)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (ready-for-vowel ?c - consonant)
  )

  ;; Vowel agent actions (may only move vowel-typed blocks)
  (:action vowel-move-from-block-to-table
    :parameters (?v - vowel ?from - block)
    :precondition (and (on ?v ?from) (clear ?v))
    :effect (and
      (ontable ?v)
      (clear ?v)
      (clear ?from)
      (not (on ?v ?from))
    )
  )

  (:action vowel-move-from-table-to-vowel
    :parameters (?v - vowel ?t - vowel)
    :precondition (and (ontable ?v) (clear ?v) (clear ?t))
    :effect (and
      (not (ontable ?v))
      (on ?v ?t)
      (not (clear ?t))
      (clear ?v)
    )
  )

  (:action vowel-move-from-table-to-consonant
    :parameters (?v - vowel ?t - consonant)
    :precondition (and (ontable ?v) (clear ?v) (clear ?t) (ready-for-vowel ?t))
    :effect (and
      (not (ontable ?v))
      (on ?v ?t)
      (not (clear ?t))
      (clear ?v)
    )
  )

  (:action vowel-move-from-block-to-vowel
    :parameters (?v - vowel ?from - block ?t - vowel)
    :precondition (and (on ?v ?from) (clear ?v) (clear ?t))
    :effect (and
      (not (on ?v ?from))
      (on ?v ?t)
      (clear ?from)
      (not (clear ?t))
      (clear ?v)
    )
  )

  (:action vowel-move-from-block-to-consonant
    :parameters (?v - vowel ?from - block ?t - consonant)
    :precondition (and (on ?v ?from) (clear ?v) (clear ?t) (ready-for-vowel ?t))
    :effect (and
      (not (on ?v ?from))
      (on ?v ?t)
      (clear ?from)
      (not (clear ?t))
      (clear ?v)
    )
  )

  ;; Consonant agent actions (may only move consonant-typed blocks)
  (:action consonant-move-from-block-to-table
    :parameters (?c - consonant ?from - block)
    :precondition (and (on ?c ?from) (clear ?c))
    :effect (and
      (ontable ?c)
      (clear ?c)
      (clear ?from)
      (not (on ?c ?from))
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?c - consonant ?t - block)
    :precondition (and (ontable ?c) (clear ?c) (clear ?t))
    :effect (and
      (not (ontable ?c))
      (on ?c ?t)
      (not (clear ?t))
      (clear ?c)
    )
  )

  (:action consonant-move-from-block-to-block
    :parameters (?c - consonant ?from - block ?t - block)
    :precondition (and (on ?c ?from) (clear ?c) (clear ?t))
    :effect (and
      (not (on ?c ?from))
      (on ?c ?t)
      (clear ?from)
      (not (clear ?t))
      (clear ?c)
    )
  )

  ;; Consonant agent may declare a consonant prepared for receiving vowels.
  ;; This models the agent-side signal that a consonant target is in the correct
  ;; place and exposed; vowels are constrained to place onto consonants only
  ;; when that consonant has been marked ready.
  (:action consonant-mark-ready
    :parameters (?c - consonant)
    :precondition (and (clear ?c))
    :effect (and (ready-for-vowel ?c))
  )
)