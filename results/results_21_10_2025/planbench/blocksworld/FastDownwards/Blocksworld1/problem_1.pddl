(define (problem blocks-problem-playerA)
  (:domain blocksworld)

  ;;; Assumptions and resolution of ambiguous observations:
  ;;; Two different initial-state reports were provided by the players and conflict.
  ;;; - playerA reported: red on blue, blue on table; yellow on orange, orange on table; red and yellow clear; hand empty.
  ;;; - playerB reported a conflicting tall stack: blue on orange on yellow on red (with blue clear) and hand empty.
  ;;; To produce a single, solvable problem consistent with an explicit plan supplied by playerA,
  ;;; we conservatively adopt playerA's initial observations as the authoritative initial state here.
  ;;; If you prefer the alternate initial state (playerB), request a separate problem.
  ;;;
  ;;; Agent goals (kept separate from the encoded planning goal):
  ;;; - playerA goal: have orange on top of red.  (Encoded below as the problem goal.)
  ;;; - playerB goal is not enforced in this problem due to the conflicting initial observation.

  (:objects
    red blue yellow orange - block
    table - place
  )

  (:init
    ;; On relations from playerA's reported initial state
    (on red blue)
    (on blue table)
    (on yellow orange)
    (on orange table)

    ;; Clear facts as reported by playerA
    (clear red)
    (clear yellow)

    ;; Hand status
    (handempty)

    ;; Note: We do NOT assert (clear blue) nor (clear orange) because each has a block on top in this initial state.
    ;; No (holding ...) facts are asserted initially.
  )

  ;; Problem goal: achieve orange on top of red (playerA's stated goal).
  ;; The explicit plan provided by playerA:
  ;;   (unstack yellow orange) ; remove yellow from orange
  ;;   (putdown yellow)         ; put yellow on the table
  ;;   (pickup orange)          ; pick orange from table
  ;;   (stack orange red)       ; stack orange on red
  ;; achieves this goal from the chosen initial state.
  (:goal (and
    (on orange red)
  ))
)