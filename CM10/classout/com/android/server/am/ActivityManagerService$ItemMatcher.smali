.class Lcom/android/server/am/ActivityManagerService$ItemMatcher;
.super Ljava/lang/Object;
.source "ActivityManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/am/ActivityManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ItemMatcher"
.end annotation


# instance fields
.field all:Z

.field components:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ComponentName;",
            ">;"
        }
    .end annotation
.end field

.field objects:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field strings:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 9360
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9361
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->all:Z

    .line 9362
    return-void
.end method


# virtual methods
.method build([Ljava/lang/String;I)I
    .registers 5
    .parameter "args"
    .parameter "opti"

    .prologue
    .line 9394
    :goto_0
    array-length v1, p1

    if-ge p2, v1, :cond_f

    .line 9395
    aget-object v0, p1, p2

    .line 9396
    .local v0, name:Ljava/lang/String;
    const-string v1, "--"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 9397
    add-int/lit8 p2, p2, 0x1

    .line 9401
    .end local v0           #name:Ljava/lang/String;
    .end local p2
    :cond_f
    return p2

    .line 9399
    .restart local v0       #name:Ljava/lang/String;
    .restart local p2
    :cond_10
    invoke-virtual {p0, v0}, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->build(Ljava/lang/String;)V

    .line 9394
    add-int/lit8 p2, p2, 0x1

    goto :goto_0
.end method

.method build(Ljava/lang/String;)V
    .registers 8
    .parameter "name"

    .prologue
    const/4 v5, 0x0

    .line 9365
    invoke-static {p1}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v0

    .line 9366
    .local v0, componentName:Landroid/content/ComponentName;
    if-eqz v0, :cond_1a

    .line 9367
    iget-object v3, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->components:Ljava/util/ArrayList;

    if-nez v3, :cond_12

    .line 9368
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->components:Ljava/util/ArrayList;

    .line 9370
    :cond_12
    iget-object v3, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->components:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9371
    iput-boolean v5, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->all:Z

    .line 9391
    :goto_19
    return-void

    .line 9373
    :cond_1a
    const/4 v2, 0x0

    .line 9376
    .local v2, objectId:I
    const/16 v3, 0x10

    :try_start_1d
    invoke-static {p1, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v2

    .line 9377
    iget-object v3, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->objects:Ljava/util/ArrayList;

    if-nez v3, :cond_2c

    .line 9378
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->objects:Ljava/util/ArrayList;

    .line 9380
    :cond_2c
    iget-object v3, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->objects:Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9381
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->all:Z
    :try_end_38
    .catch Ljava/lang/RuntimeException; {:try_start_1d .. :try_end_38} :catch_39

    goto :goto_19

    .line 9382
    :catch_39
    move-exception v1

    .line 9384
    .local v1, e:Ljava/lang/RuntimeException;
    iget-object v3, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->strings:Ljava/util/ArrayList;

    if-nez v3, :cond_45

    .line 9385
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->strings:Ljava/util/ArrayList;

    .line 9387
    :cond_45
    iget-object v3, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->strings:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9388
    iput-boolean v5, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->all:Z

    goto :goto_19
.end method

.method match(Ljava/lang/Object;Landroid/content/ComponentName;)Z
    .registers 8
    .parameter "object"
    .parameter "comp"

    .prologue
    const/4 v3, 0x1

    .line 9405
    iget-boolean v2, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->all:Z

    if-eqz v2, :cond_7

    move v2, v3

    .line 9430
    :goto_6
    return v2

    .line 9408
    :cond_7
    iget-object v2, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->components:Ljava/util/ArrayList;

    if-eqz v2, :cond_27

    .line 9409
    const/4 v1, 0x0

    .local v1, i:I
    :goto_c
    iget-object v2, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->components:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_27

    .line 9410
    iget-object v2, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->components:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/ComponentName;

    invoke-virtual {v2, p2}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24

    move v2, v3

    .line 9411
    goto :goto_6

    .line 9409
    :cond_24
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 9415
    .end local v1           #i:I
    :cond_27
    iget-object v2, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->objects:Ljava/util/ArrayList;

    if-eqz v2, :cond_4b

    .line 9416
    const/4 v1, 0x0

    .restart local v1       #i:I
    :goto_2c
    iget-object v2, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->objects:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_4b

    .line 9417
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v4

    iget-object v2, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->objects:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v4, v2, :cond_48

    move v2, v3

    .line 9418
    goto :goto_6

    .line 9416
    :cond_48
    add-int/lit8 v1, v1, 0x1

    goto :goto_2c

    .line 9422
    .end local v1           #i:I
    :cond_4b
    iget-object v2, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->strings:Ljava/util/ArrayList;

    if-eqz v2, :cond_6f

    .line 9423
    invoke-virtual {p2}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object v0

    .line 9424
    .local v0, flat:Ljava/lang/String;
    const/4 v1, 0x0

    .restart local v1       #i:I
    :goto_54
    iget-object v2, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->strings:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_6f

    .line 9425
    iget-object v2, p0, Lcom/android/server/am/ActivityManagerService$ItemMatcher;->strings:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_6c

    move v2, v3

    .line 9426
    goto :goto_6

    .line 9424
    :cond_6c
    add-int/lit8 v1, v1, 0x1

    goto :goto_54

    .line 9430
    .end local v0           #flat:Ljava/lang/String;
    .end local v1           #i:I
    :cond_6f
    const/4 v2, 0x0

    goto :goto_6
.end method
