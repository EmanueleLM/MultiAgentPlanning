(define (domain hanoi-5-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types place agent step)

  (:predicates
    ;; type markers
    (disk ?x - place)
    (peg ?x - place)

    ;; structural relations
    (on ?d - place ?p - place)   ;; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)           ;; nothing is directly on place ?p (place can be peg or disk)

    ;; static size ordering among disks (smaller is static)
    (smaller ?d1 - place ?d2 - place)

    ;; explicit discrete stage progression
    (next ?s - step ?s2 - step)  ;; successor relation for stages (static)
    (at-step ?s - step)          ;; current global stage marker (exactly one true at any time)
  )

  ;; Move the top disk onto an empty peg, advancing one discrete stage.
  (:action move-to-peg
    :parameters (?a - agent ?d - place ?from - place ?to - place ?s - step ?s2 - step)
    :precondition (and
      (disk ?d)
      (peg ?to)
      (on ?d ?from)        ;; d is directly on ?from
      (clear ?d)           ;; nothing on top of d (d is the top disk of its stack)
      (clear ?to)          ;; destination must be empty (top of destination)
      (next ?s ?s2)        ;; must advance to immediate successor stage
      (at-step ?s)         ;; action takes place at current stage ?s
      (not (= ?d ?to))     ;; prevent trivial self-placement
    )
    :effect (and
      ;; move disk d from ?from to ?to
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear markers: destination is no longer clear; source becomes clear
      (not (clear ?to))
      (clear ?from)

      ;; advance global stage atomically
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; Move the top disk onto another disk (only if smaller), advancing one discrete stage.
  (:action move-to-disk
    :parameters (?a - agent ?d - place ?from - place ?to - place ?s - step ?s2 - step)
    :precondition (and
      (disk ?d)
      (disk ?to)
      (on ?d ?from)        ;; d is directly on ?from
      (clear ?d)           ;; d is top
      (clear ?to)          ;; destination disk must be the top of its stack
      (smaller ?d ?to)     ;; size constraint: d must be smaller than destination disk
      (next ?s ?s2)        ;; must advance to immediate successor stage
      (at-step ?s)         ;; action takes place at current stage ?s
      (not (= ?d ?to))     ;; prevent self-placement
    )
    :effect (and
      ;; move disk d from ?from onto disk ?to
      (not (on ?d ?from))
      (on ?d ?to)

      ;; destination disk no longer clear; source becomes clear
      (not (clear ?to))
      (clear ?from)

      ;; advance global stage atomically
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)