(define (problem mystery-blocksworld8-p1)
    (:domain mystery-blocksworld8)
    (:objects
        a - item
        b - item
        c - item
        d - item
    )
    (:init
        (ObjectCraves c b)
        (ObjectCraves d a)
        (Harmony)
        (Planet a)
        (Planet b)
        (Province c)
        (Province d)
    )
    (:goal (and
        (ObjectCraves a d)
        (ObjectCraves b c)
    ))
)