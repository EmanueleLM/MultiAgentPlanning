(define (problem blocks-unstacker-problem)
  (:domain blocks-multiagent)
  (:objects
    orange yellow red blue - block
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 - stage
  )
  (:init
    ;; single global hand resource
    (hand-empty)

    ;; initial layout: yellow on red on blue; orange on table
    (on-table orange)
    (on-table blue)
    (on yellow red)
    (on red blue)

    ;; clear means no block on top and not being held; initially orange and yellow have no blocks on top
    (clear orange)
    (clear yellow)

    ;; strict discrete stage progression enforced by succ links
    (succ stage0 stage1)
    (succ stage1 stage2)
    (succ stage2 stage3)
    (succ stage3 stage4)
    (succ stage4 stage5)
    (succ stage5 stage6)
    (succ stage6 stage7)
    (succ stage7 stage8)

    ;; plan must progress contiguously from stage0 to stage8; actions consume the current at-stage
    (at-stage stage0)
  )
  (:goal (and
           (on red orange)
           (on orange blue)
           (at-stage stage8)
         )))