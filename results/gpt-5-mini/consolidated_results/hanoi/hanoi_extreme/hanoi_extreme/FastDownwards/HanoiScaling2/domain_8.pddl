(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  ;;; Types:
  ;;;  - disk and peg are subtypes of place (so predicates over place accept disks and pegs)
  ;;;  - step is a separate type used to model discrete ordered stages
  (:types disk peg - place step)

  (:predicates
    ;; disk ?d is directly on place ?p (place = peg or disk)
    (on ?d - disk ?p - place)
    ;; place ?p (peg or disk) has nothing directly on top of it
    (clear ?p - place)
    ;; static strict size order between disks
    (smaller ?d1 - disk ?d2 - disk)
    ;; current discrete stage marker (exactly one at any time is enforced by action effects)
    (at-step ?s - step)
    ;; strict successor relation between stages (actions may only advance to direct successor)
    (next ?s1 - step ?s2 - step)
  )

  ;; Move a top disk ?d (no disk above it) from its current support ?from (peg or disk)
  ;; onto an empty peg ?to, advancing time from step ?s to its successor ?s2.
  ;; Preconditions ensure only the top disk is moved, destination peg is empty, and the stage advances strictly.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (at-step ?s)
                    (next ?s ?s2)
                   )
    :effect (and
              ;; relocate ?d
              (not (on ?d ?from))
              (on ?d ?to)
              ;; former support now has nothing directly on top
              (clear ?from)
              ;; destination peg no longer clear (has ?d on top)
              (not (clear ?to))
              ;; advance the stage marker exactly from ?s to ?s2
              (not (at-step ?s))
              (at-step ?s2)
             )
  )

  ;; Move a top disk ?d from its current support ?from (peg or disk) onto another disk ?to,
  ;; allowed only if ?d is strictly smaller than ?to and ?to has no disk on top.
  ;; Advances the stage marker from ?s to its successor ?s2.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                    (at-step ?s)
                    (next ?s ?s2)
                   )
    :effect (and
              ;; relocate ?d
              (not (on ?d ?from))
              (on ?d ?to)
              ;; former support now has nothing directly on top
              (clear ?from)
              ;; destination disk no longer clear (has ?d on top)
              (not (clear ?to))
              ;; advance the stage marker exactly from ?s to ?s2
              (not (at-step ?s))
              (at-step ?s2)
             )
  )
)