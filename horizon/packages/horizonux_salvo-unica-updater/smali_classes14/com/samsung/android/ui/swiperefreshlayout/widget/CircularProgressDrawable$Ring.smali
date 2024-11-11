.class Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;
.super Ljava/lang/Object;
.source "CircularProgressDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Ring"
.end annotation


# instance fields
.field mAlpha:I

.field mArrow:Landroid/graphics/Path;

.field mArrowHeight:I

.field final mArrowPaint:Landroid/graphics/Paint;

.field mArrowScale:F

.field mArrowWidth:I

.field final mCirclePaint:Landroid/graphics/Paint;

.field mColorIndex:I

.field mColors:[I

.field mCurrentColor:I

.field mEndTrim:F

.field final mPaint:Landroid/graphics/Paint;

.field mRingCenterRadius:F

.field mRotation:F

.field mShowArrow:Z

.field mStartTrim:F

.field mStartingEndTrim:F

.field mStartingRotation:F

.field mStartingStartTrim:F

.field mStrokeWidth:F

.field final mTempBounds:Landroid/graphics/RectF;


# direct methods
.method constructor <init>()V
    .locals 5

    .line 430
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 408
    const/16 v0, 0xff

    iput v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mAlpha:I

    .line 411
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowPaint:Landroid/graphics/Paint;

    .line 412
    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowScale:F

    .line 414
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mCirclePaint:Landroid/graphics/Paint;

    .line 418
    const/4 v2, 0x0

    iput v2, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mEndTrim:F

    .line 419
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mPaint:Landroid/graphics/Paint;

    .line 421
    iput v2, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mRotation:F

    .line 423
    iput v2, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStartTrim:F

    .line 427
    const/high16 v2, 0x40a00000    # 5.0f

    iput v2, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStrokeWidth:F

    .line 428
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mTempBounds:Landroid/graphics/RectF;

    .line 431
    sget-object v2, Landroid/graphics/Paint$Cap;->SQUARE:Landroid/graphics/Paint$Cap;

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 432
    const/4 v2, 0x1

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 433
    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 434
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 435
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 436
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 437
    return-void
.end method


# virtual methods
.method draw(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 10
    .param p1, "var1"    # Landroid/graphics/Canvas;
    .param p2, "var2"    # Landroid/graphics/Rect;

    .line 440
    iget-object v6, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mTempBounds:Landroid/graphics/RectF;

    .line 441
    .local v6, "var3":Landroid/graphics/RectF;
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mRingCenterRadius:F

    .line 442
    .local v0, "var4":F
    iget v1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStrokeWidth:F

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    add-float/2addr v1, v0

    .line 443
    .local v1, "var5":F
    const/4 v3, 0x0

    cmpg-float v3, v0, v3

    if-gtz v3, :cond_0

    .line 444
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v2

    iget v4, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowWidth:I

    int-to-float v4, v4

    iget v5, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowScale:F

    mul-float/2addr v4, v5

    div-float/2addr v4, v2

    iget v5, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStrokeWidth:F

    div-float/2addr v5, v2

    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    move-result v4

    sub-float v1, v3, v4

    .line 447
    :cond_0
    invoke-virtual {p2}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v3, v1

    invoke-virtual {p2}, Landroid/graphics/Rect;->centerY()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v4, v1

    invoke-virtual {p2}, Landroid/graphics/Rect;->centerX()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v5, v1

    invoke-virtual {p2}, Landroid/graphics/Rect;->centerY()I

    move-result v7

    int-to-float v7, v7

    add-float/2addr v7, v1

    invoke-virtual {v6, v3, v4, v5, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 448
    iget v1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStartTrim:F

    .line 449
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mRotation:F

    .line 450
    add-float v3, v1, v0

    const/high16 v4, 0x43b40000    # 360.0f

    mul-float v7, v3, v4

    .line 451
    .end local v1    # "var5":F
    .local v7, "var5":F
    iget v1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mEndTrim:F

    add-float/2addr v1, v0

    mul-float/2addr v1, v4

    sub-float v8, v1, v7

    .line 452
    .end local v0    # "var4":F
    .local v8, "var4":F
    iget-object v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mCurrentColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 453
    iget-object v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 454
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStrokeWidth:F

    div-float/2addr v0, v2

    .line 455
    .local v0, "var6":F
    invoke-virtual {v6, v0, v0}, Landroid/graphics/RectF;->inset(FF)V

    .line 456
    invoke-virtual {v6}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    invoke-virtual {v6}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v4

    div-float/2addr v4, v2

    iget-object v2, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v3, v4, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 457
    neg-float v9, v0

    .line 458
    .end local v0    # "var6":F
    .local v9, "var6":F
    invoke-virtual {v6, v9, v9}, Landroid/graphics/RectF;->inset(FF)V

    .line 459
    const/4 v4, 0x0

    iget-object v5, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move-object v1, v6

    move v2, v7

    move v3, v8

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 460
    invoke-virtual {p0, p1, v7, v8, v6}, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->drawTriangle(Landroid/graphics/Canvas;FFLandroid/graphics/RectF;)V

    .line 461
    return-void
.end method

.method drawTriangle(Landroid/graphics/Canvas;FFLandroid/graphics/RectF;)V
    .locals 10
    .param p1, "var1"    # Landroid/graphics/Canvas;
    .param p2, "var2"    # F
    .param p3, "var3"    # F
    .param p4, "var4"    # Landroid/graphics/RectF;

    .line 464
    iget-boolean v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mShowArrow:Z

    if-eqz v0, :cond_1

    .line 465
    iget-object v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrow:Landroid/graphics/Path;

    .line 466
    .local v0, "var5":Landroid/graphics/Path;
    if-nez v0, :cond_0

    .line 467
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrow:Landroid/graphics/Path;

    .line 468
    sget-object v2, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    invoke-virtual {v1, v2}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    goto :goto_0

    .line 470
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 473
    :goto_0
    invoke-virtual {p4}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-virtual {p4}, Landroid/graphics/RectF;->height()F

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    .line 474
    .local v1, "var6":F
    iget v3, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowWidth:I

    int-to-float v3, v3

    iget v4, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowScale:F

    mul-float/2addr v3, v4

    div-float/2addr v3, v2

    .line 475
    .local v3, "var7":F
    iget-object v4, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrow:Landroid/graphics/Path;

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 476
    iget-object v4, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrow:Landroid/graphics/Path;

    iget v6, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowWidth:I

    int-to-float v6, v6

    iget v7, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowScale:F

    mul-float/2addr v6, v7

    invoke-virtual {v4, v6, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 477
    iget-object v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrow:Landroid/graphics/Path;

    .line 478
    iget v4, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowWidth:I

    int-to-float v4, v4

    .line 479
    .local v4, "var8":F
    iget v5, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowScale:F

    .line 480
    .local v5, "var9":F
    mul-float v6, v4, v5

    div-float/2addr v6, v2

    iget v7, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowHeight:I

    int-to-float v7, v7

    mul-float/2addr v7, v5

    invoke-virtual {v0, v6, v7}, Landroid/graphics/Path;->lineTo(FF)V

    .line 481
    iget-object v6, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrow:Landroid/graphics/Path;

    invoke-virtual {p4}, Landroid/graphics/RectF;->centerX()F

    move-result v7

    add-float/2addr v7, v1

    sub-float/2addr v7, v3

    invoke-virtual {p4}, Landroid/graphics/RectF;->centerY()F

    move-result v8

    iget v9, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStrokeWidth:F

    div-float/2addr v9, v2

    add-float/2addr v8, v9

    invoke-virtual {v6, v7, v8}, Landroid/graphics/Path;->offset(FF)V

    .line 482
    iget-object v2, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrow:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 483
    iget-object v2, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowPaint:Landroid/graphics/Paint;

    iget v6, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mCurrentColor:I

    invoke-virtual {v2, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 484
    iget-object v2, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowPaint:Landroid/graphics/Paint;

    iget v6, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mAlpha:I

    invoke-virtual {v2, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 485
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 486
    add-float v2, p2, p3

    invoke-virtual {p4}, Landroid/graphics/RectF;->centerX()F

    move-result v6

    invoke-virtual {p4}, Landroid/graphics/RectF;->centerY()F

    move-result v7

    invoke-virtual {p1, v2, v6, v7}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 487
    iget-object v2, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrow:Landroid/graphics/Path;

    iget-object v6, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v6}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 488
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 491
    .end local v0    # "var5":Landroid/graphics/Path;
    .end local v1    # "var6":F
    .end local v3    # "var7":F
    .end local v4    # "var8":F
    .end local v5    # "var9":F
    :cond_1
    return-void
.end method

.method getAlpha()I
    .locals 1

    .line 494
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mAlpha:I

    return v0
.end method

.method getArrowHeight()F
    .locals 1

    .line 498
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowHeight:I

    int-to-float v0, v0

    return v0
.end method

.method getArrowScale()F
    .locals 1

    .line 502
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowScale:F

    return v0
.end method

.method getArrowWidth()F
    .locals 1

    .line 506
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowWidth:I

    int-to-float v0, v0

    return v0
.end method

.method getBackgroundColor()I
    .locals 1

    .line 510
    iget-object v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getColor()I

    move-result v0

    return v0
.end method

.method getCenterRadius()F
    .locals 1

    .line 514
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mRingCenterRadius:F

    return v0
.end method

.method getColors()[I
    .locals 1

    .line 518
    iget-object v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mColors:[I

    return-object v0
.end method

.method getEndTrim()F
    .locals 1

    .line 522
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mEndTrim:F

    return v0
.end method

.method getNextColor()I
    .locals 2

    .line 526
    iget-object v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mColors:[I

    invoke-virtual {p0}, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->getNextColorIndex()I

    move-result v1

    aget v0, v0, v1

    return v0
.end method

.method getNextColorIndex()I
    .locals 2

    .line 530
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mColorIndex:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mColors:[I

    array-length v1, v1

    rem-int/2addr v0, v1

    return v0
.end method

.method getRotation()F
    .locals 1

    .line 534
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mRotation:F

    return v0
.end method

.method getShowArrow()Z
    .locals 1

    .line 538
    iget-boolean v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mShowArrow:Z

    return v0
.end method

.method getStartTrim()F
    .locals 1

    .line 542
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStartTrim:F

    return v0
.end method

.method getStartingColor()I
    .locals 2

    .line 546
    iget-object v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mColors:[I

    iget v1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mColorIndex:I

    aget v0, v0, v1

    return v0
.end method

.method getStartingEndTrim()F
    .locals 1

    .line 550
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStartingEndTrim:F

    return v0
.end method

.method getStartingRotation()F
    .locals 1

    .line 554
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStartingRotation:F

    return v0
.end method

.method getStartingStartTrim()F
    .locals 1

    .line 558
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStartingStartTrim:F

    return v0
.end method

.method getStrokeCap()Landroid/graphics/Paint$Cap;
    .locals 1

    .line 562
    iget-object v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getStrokeCap()Landroid/graphics/Paint$Cap;

    move-result-object v0

    return-object v0
.end method

.method getStrokeWidth()F
    .locals 1

    .line 566
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStrokeWidth:F

    return v0
.end method

.method goToNextColor()V
    .locals 1

    .line 570
    invoke-virtual {p0}, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->getNextColorIndex()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->setColorIndex(I)V

    .line 571
    return-void
.end method

.method resetOriginals()V
    .locals 1

    .line 574
    const/4 v0, 0x0

    iput v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStartingStartTrim:F

    .line 575
    iput v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStartingEndTrim:F

    .line 576
    iput v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStartingRotation:F

    .line 577
    invoke-virtual {p0, v0}, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->setStartTrim(F)V

    .line 578
    invoke-virtual {p0, v0}, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->setEndTrim(F)V

    .line 579
    invoke-virtual {p0, v0}, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->setRotation(F)V

    .line 580
    return-void
.end method

.method setAlpha(I)V
    .locals 0
    .param p1, "var1"    # I

    .line 583
    iput p1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mAlpha:I

    .line 584
    return-void
.end method

.method setArrowDimensions(FF)V
    .locals 1
    .param p1, "var1"    # F
    .param p2, "var2"    # F

    .line 587
    float-to-int v0, p1

    iput v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowWidth:I

    .line 588
    float-to-int v0, p2

    iput v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowHeight:I

    .line 589
    return-void
.end method

.method setArrowScale(F)V
    .locals 1
    .param p1, "var1"    # F

    .line 592
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowScale:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    .line 593
    iput p1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mArrowScale:F

    .line 596
    :cond_0
    return-void
.end method

.method setBackgroundColor(I)V
    .locals 1
    .param p1, "var1"    # I

    .line 599
    iget-object v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 600
    return-void
.end method

.method setCenterRadius(F)V
    .locals 0
    .param p1, "var1"    # F

    .line 603
    iput p1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mRingCenterRadius:F

    .line 604
    return-void
.end method

.method setColor(I)V
    .locals 0
    .param p1, "var1"    # I

    .line 607
    iput p1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mCurrentColor:I

    .line 608
    return-void
.end method

.method setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1
    .param p1, "var1"    # Landroid/graphics/ColorFilter;

    .line 611
    iget-object v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 612
    return-void
.end method

.method setColorIndex(I)V
    .locals 1
    .param p1, "var1"    # I

    .line 615
    iput p1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mColorIndex:I

    .line 616
    iget-object v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mColors:[I

    aget v0, v0, p1

    iput v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mCurrentColor:I

    .line 617
    return-void
.end method

.method setColors([I)V
    .locals 1
    .param p1, "var1"    # [I

    .line 620
    iput-object p1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mColors:[I

    .line 621
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->setColorIndex(I)V

    .line 622
    return-void
.end method

.method setEndTrim(F)V
    .locals 0
    .param p1, "var1"    # F

    .line 625
    iput p1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mEndTrim:F

    .line 626
    return-void
.end method

.method setRotation(F)V
    .locals 0
    .param p1, "var1"    # F

    .line 629
    iput p1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mRotation:F

    .line 630
    return-void
.end method

.method setShowArrow(Z)V
    .locals 1
    .param p1, "var1"    # Z

    .line 633
    iget-boolean v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mShowArrow:Z

    if-eq v0, p1, :cond_0

    .line 634
    iput-boolean p1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mShowArrow:Z

    .line 637
    :cond_0
    return-void
.end method

.method setStartTrim(F)V
    .locals 0
    .param p1, "var1"    # F

    .line 640
    iput p1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStartTrim:F

    .line 641
    return-void
.end method

.method setStrokeCap(Landroid/graphics/Paint$Cap;)V
    .locals 1
    .param p1, "var1"    # Landroid/graphics/Paint$Cap;

    .line 644
    iget-object v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 645
    return-void
.end method

.method setStrokeWidth(F)V
    .locals 1
    .param p1, "var1"    # F

    .line 648
    iput p1, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStrokeWidth:F

    .line 649
    iget-object v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 650
    return-void
.end method

.method storeOriginals()V
    .locals 1

    .line 653
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStartTrim:F

    iput v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStartingStartTrim:F

    .line 654
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mEndTrim:F

    iput v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStartingEndTrim:F

    .line 655
    iget v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mRotation:F

    iput v0, p0, Lcom/samsung/android/ui/swiperefreshlayout/widget/CircularProgressDrawable$Ring;->mStartingRotation:F

    .line 656
    return-void
.end method
