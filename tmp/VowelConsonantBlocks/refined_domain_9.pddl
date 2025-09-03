(define (domain multi-agent-blocks-classical-fd)
  (:requirements :strips :typing :equality)
  (:types block phase)
  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
    (current-phase ?p - phase)
  )
  (:constants
    phase1 phase2 phase3 - phase
  )
  (:action move-vowel-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and (vowel ?x) (clear ?x) (clear ?to) (on ?x ?from) (current-phase phase1))
    :effect (and (not (on ?x ?from)) (on ?x ?to) (not (clear ?to)) (clear ?from))
  )
  (:action move-vowel-block-to-table
    :parameters (?x - block ?from - block)
    :precondition (and (vowel ?x) (clear ?x) (on ?x ?from) (current-phase phase1))
    :effect (and (not (on ?x ?from)) (on-table ?x) (clear ?from))
  )
  (:action move-consonant-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and (consonant ?x) (clear ?x) (clear ?to) (on ?x ?from) (current-phase phase2))
    :effect (and (not (on ?x ?from)) (on ?x ?to) (not (clear ?to)) (clear ?from))
  )
  (:action move-consonant-block-to-table
    :parameters (?x - block ?from - block)
    :precondition (and (consonant ?x) (clear ?x) (on ?x ?from) (current-phase phase2))
    :effect (and (not (on ?x ?from)) (on-table ?x) (clear ?from))
  )
  (:action move-consonant-block-to-vowel
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and (consonant ?x) (clear ?x) (vowel ?to) (clear ?to) (on ?x ?from) (current-phase phase3))
    :effect (and (not (on ?x ?from)) (on ?x ?to) (not (clear ?to)) (clear ?from))
  )
  (:action move-vowel-block-to-consonant
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and (vowel ?x) (clear ?x) (consonant ?to) (clear ?to) (on ?x ?from) (current-phase phase3))
    :effect (and (not (on ?x ?from)) (on ?x ?to) (not (clear ?to)) (clear ?from))
  )
  (:action advance-phase
    :parameters (?current ?next - phase)
    :precondition (current-phase ?current)
    :effect (and (not (current-phase ?current)) (current-phase ?next))
  )
)