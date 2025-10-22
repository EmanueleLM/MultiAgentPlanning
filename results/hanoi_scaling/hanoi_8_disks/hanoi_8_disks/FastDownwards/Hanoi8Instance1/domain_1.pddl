(define (domain tower-of-hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg object)
  ;; declare disk and peg as subtypes of object
  ;; (PDDL typing syntax: list subtypes then '-' then supertype in objects declaration is not required; for clarity we keep disk and peg as distinct types)
  (:predicates
    ;; on ?d ?x : disk ?d is immediately on thing ?x (either a disk or a peg)
    (on ?d - disk ?x - object)
    ;; top ?d ?p : disk ?d is the top disk of peg ?p
    (top ?d - disk ?p - peg)
    ;; empty ?p : peg ?p has no disks
    (empty ?p - peg)
    ;; smaller ?d1 ?d2 : disk d1 is strictly smaller than disk d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; We create explicit actions for each ordered peg pair. Each ordered peg pair has four move variants:
  ;; 1) destination is empty, moving disk is directly on the origin peg
  ;; 2) destination is empty, moving disk is on another disk below
  ;; 3) destination has a top disk, moving disk is directly on the origin peg
  ;; 4) destination has a top disk, moving disk is on another disk below
  ;; This avoids disjunctions/existentials and ensures all constraints are enforced by preconditions.

  ;; --------- LEFT -> MIDDLE ----------
  (:action move-left-to-middle-empty-from-peg
    :parameters (?d - disk)
    :precondition (and
      (top ?d left)
      (on ?d left)
      (empty middle)
    )
    :effect (and
      (not (top ?d left))
      (not (on ?d left))
      (on ?d middle)
      (top ?d middle)
      (not (empty middle))
      (empty left)
    )
  )

  (:action move-left-to-middle-empty-from-disk
    :parameters (?d - disk ?below - disk)
    :precondition (and
      (top ?d left)
      (on ?d ?below)
      (empty middle)
    )
    :effect (and
      (not (top ?d left))
      (not (on ?d ?below))
      (on ?d middle)
      (top ?d middle)
      (not (empty middle))
      (top ?below left)
    )
  )

  (:action move-left-to-middle-onto-disk-from-peg
    :parameters (?d - disk ?t - disk)
    :precondition (and
      (top ?d left)
      (on ?d left)
      (top ?t middle)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d left))
      (not (on ?d left))
      (on ?d ?t)
      (not (top ?t middle))
      (top ?d middle)
      (empty left)
    )
  )

  (:action move-left-to-middle-onto-disk-from-disk
    :parameters (?d - disk ?t - disk ?below - disk)
    :precondition (and
      (top ?d left)
      (on ?d ?below)
      (top ?t middle)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d left))
      (not (on ?d ?below))
      (on ?d ?t)
      (not (top ?t middle))
      (top ?d middle)
      (top ?below left)
    )
  )

  ;; --------- LEFT -> RIGHT ----------
  (:action move-left-to-right-empty-from-peg
    :parameters (?d - disk)
    :precondition (and
      (top ?d left)
      (on ?d left)
      (empty right)
    )
    :effect (and
      (not (top ?d left))
      (not (on ?d left))
      (on ?d right)
      (top ?d right)
      (not (empty right))
      (empty left)
    )
  )

  (:action move-left-to-right-empty-from-disk
    :parameters (?d - disk ?below - disk)
    :precondition (and
      (top ?d left)
      (on ?d ?below)
      (empty right)
    )
    :effect (and
      (not (top ?d left))
      (not (on ?d ?below))
      (on ?d right)
      (top ?d right)
      (not (empty right))
      (top ?below left)
    )
  )

  (:action move-left-to-right-onto-disk-from-peg
    :parameters (?d - disk ?t - disk)
    :precondition (and
      (top ?d left)
      (on ?d left)
      (top ?t right)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d left))
      (not (on ?d left))
      (on ?d ?t)
      (not (top ?t right))
      (top ?d right)
      (empty left)
    )
  )

  (:action move-left-to-right-onto-disk-from-disk
    :parameters (?d - disk ?t - disk ?below - disk)
    :precondition (and
      (top ?d left)
      (on ?d ?below)
      (top ?t right)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d left))
      (not (on ?d ?below))
      (on ?d ?t)
      (not (top ?t right))
      (top ?d right)
      (top ?below left)
    )
  )

  ;; --------- MIDDLE -> LEFT ----------
  (:action move-middle-to-left-empty-from-peg
    :parameters (?d - disk)
    :precondition (and
      (top ?d middle)
      (on ?d middle)
      (empty left)
    )
    :effect (and
      (not (top ?d middle))
      (not (on ?d middle))
      (on ?d left)
      (top ?d left)
      (not (empty left))
      (empty middle)
    )
  )

  (:action move-middle-to-left-empty-from-disk
    :parameters (?d - disk ?below - disk)
    :precondition (and
      (top ?d middle)
      (on ?d ?below)
      (empty left)
    )
    :effect (and
      (not (top ?d middle))
      (not (on ?d ?below))
      (on ?d left)
      (top ?d left)
      (not (empty left))
      (top ?below middle)
    )
  )

  (:action move-middle-to-left-onto-disk-from-peg
    :parameters (?d - disk ?t - disk)
    :precondition (and
      (top ?d middle)
      (on ?d middle)
      (top ?t left)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d middle))
      (not (on ?d middle))
      (on ?d ?t)
      (not (top ?t left))
      (top ?d left)
      (empty middle)
    )
  )

  (:action move-middle-to-left-onto-disk-from-disk
    :parameters (?d - disk ?t - disk ?below - disk)
    :precondition (and
      (top ?d middle)
      (on ?d ?below)
      (top ?t left)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d middle))
      (not (on ?d ?below))
      (on ?d ?t)
      (not (top ?t left))
      (top ?d left)
      (top ?below middle)
    )
  )

  ;; --------- MIDDLE -> RIGHT ----------
  (:action move-middle-to-right-empty-from-peg
    :parameters (?d - disk)
    :precondition (and
      (top ?d middle)
      (on ?d middle)
      (empty right)
    )
    :effect (and
      (not (top ?d middle))
      (not (on ?d middle))
      (on ?d right)
      (top ?d right)
      (not (empty right))
      (empty middle)
    )
  )

  (:action move-middle-to-right-empty-from-disk
    :parameters (?d - disk ?below - disk)
    :precondition (and
      (top ?d middle)
      (on ?d ?below)
      (empty right)
    )
    :effect (and
      (not (top ?d middle))
      (not (on ?d ?below))
      (on ?d right)
      (top ?d right)
      (not (empty right))
      (top ?below middle)
    )
  )

  (:action move-middle-to-right-onto-disk-from-peg
    :parameters (?d - disk ?t - disk)
    :precondition (and
      (top ?d middle)
      (on ?d middle)
      (top ?t right)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d middle))
      (not (on ?d middle))
      (on ?d ?t)
      (not (top ?t right))
      (top ?d right)
      (empty middle)
    )
  )

  (:action move-middle-to-right-onto-disk-from-disk
    :parameters (?d - disk ?t - disk ?below - disk)
    :precondition (and
      (top ?d middle)
      (on ?d ?below)
      (top ?t right)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d middle))
      (not (on ?d ?below))
      (on ?d ?t)
      (not (top ?t right))
      (top ?d right)
      (top ?below middle)
    )
  )

  ;; --------- RIGHT -> LEFT ----------
  (:action move-right-to-left-empty-from-peg
    :parameters (?d - disk)
    :precondition (and
      (top ?d right)
      (on ?d right)
      (empty left)
    )
    :effect (and
      (not (top ?d right))
      (not (on ?d right))
      (on ?d left)
      (top ?d left)
      (not (empty left))
      (empty right)
    )
  )

  (:action move-right-to-left-empty-from-disk
    :parameters (?d - disk ?below - disk)
    :precondition (and
      (top ?d right)
      (on ?d ?below)
      (empty left)
    )
    :effect (and
      (not (top ?d right))
      (not (on ?d ?below))
      (on ?d left)
      (top ?d left)
      (not (empty left))
      (top ?below right)
    )
  )

  (:action move-right-to-left-onto-disk-from-peg
    :parameters (?d - disk ?t - disk)
    :precondition (and
      (top ?d right)
      (on ?d right)
      (top ?t left)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d right))
      (not (on ?d right))
      (on ?d ?t)
      (not (top ?t left))
      (top ?d left)
      (empty right)
    )
  )

  (:action move-right-to-left-onto-disk-from-disk
    :parameters (?d - disk ?t - disk ?below - disk)
    :precondition (and
      (top ?d right)
      (on ?d ?below)
      (top ?t left)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d right))
      (not (on ?d ?below))
      (on ?d ?t)
      (not (top ?t left))
      (top ?d left)
      (top ?below right)
    )
  )

  ;; --------- RIGHT -> MIDDLE ----------
  (:action move-right-to-middle-empty-from-peg
    :parameters (?d - disk)
    :precondition (and
      (top ?d right)
      (on ?d right)
      (empty middle)
    )
    :effect (and
      (not (top ?d right))
      (not (on ?d right))
      (on ?d middle)
      (top ?d middle)
      (not (empty middle))
      (empty right)
    )
  )

  (:action move-right-to-middle-empty-from-disk
    :parameters (?d - disk ?below - disk)
    :precondition (and
      (top ?d right)
      (on ?d ?below)
      (empty middle)
    )
    :effect (and
      (not (top ?d right))
      (not (on ?d ?below))
      (on ?d middle)
      (top ?d middle)
      (not (empty middle))
      (top ?below right)
    )
  )

  (:action move-right-to-middle-onto-disk-from-peg
    :parameters (?d - disk ?t - disk)
    :precondition (and
      (top ?d right)
      (on ?d right)
      (top ?t middle)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d right))
      (not (on ?d right))
      (on ?d ?t)
      (not (top ?t middle))
      (top ?d middle)
      (empty right)
    )
  )

  (:action move-right-to-middle-onto-disk-from-disk
    :parameters (?d - disk ?t - disk ?below - disk)
    :precondition (and
      (top ?d right)
      (on ?d ?below)
      (top ?t middle)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d right))
      (not (on ?d ?below))
      (on ?d ?t)
      (not (top ?t middle))
      (top ?d middle)
      (top ?below right)
    )
  )
)