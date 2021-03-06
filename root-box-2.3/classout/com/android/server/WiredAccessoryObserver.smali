.class Lcom/android/server/WiredAccessoryObserver;
.super Landroid/os/UEventObserver;
.source "WiredAccessoryObserver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/WiredAccessoryObserver$BootCompletedReceiver;,
        Lcom/android/server/WiredAccessoryObserver$SettingsChangedReceiver;,
        Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    }
.end annotation


# static fields
.field private static final BIT_HDMI_AUDIO:I = 0x10

.field private static final BIT_HEADSET:I = 0x1

.field private static final BIT_HEADSET_NO_MIC:I = 0x2

.field private static final BIT_USB_HEADSET_ANLG:I = 0x4

.field private static final BIT_USB_HEADSET_DGTL:I = 0x8

.field private static final HEADSETS_WITH_MIC:I = 0x1

.field private static final LOG:Z = true

.field private static final SUPPORTED_HEADSETS:I = 0x1f

.field private static final TAG:Ljava/lang/String;

.field private static uEventInfo:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/server/WiredAccessoryObserver$UEventInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private dockAudioEnabled:Z

.field private final mAudioManager:Landroid/media/AudioManager;

.field private final mContext:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field private mHeadsetName:Ljava/lang/String;

.field private mHeadsetState:I

.field private mPrevHeadsetState:I

.field private final mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 43
    const-class v0, Lcom/android/server/WiredAccessoryObserver;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    .line 141
    invoke-static {}, Lcom/android/server/WiredAccessoryObserver;->makeObservedUEventList()Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/android/server/WiredAccessoryObserver;->uEventInfo:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 8
    .parameter "context"

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 153
    invoke-direct {p0}, Landroid/os/UEventObserver;-><init>()V

    .line 146
    iput-boolean v4, p0, Lcom/android/server/WiredAccessoryObserver;->dockAudioEnabled:Z

    .line 352
    new-instance v2, Lcom/android/server/WiredAccessoryObserver$1;

    invoke-direct {v2, p0}, Lcom/android/server/WiredAccessoryObserver$1;-><init>(Lcom/android/server/WiredAccessoryObserver;)V

    iput-object v2, p0, Lcom/android/server/WiredAccessoryObserver;->mHandler:Landroid/os/Handler;

    .line 154
    iput-object p1, p0, Lcom/android/server/WiredAccessoryObserver;->mContext:Landroid/content/Context;

    .line 155
    const-string v2, "power"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    .line 156
    .local v1, pm:Landroid/os/PowerManager;
    const/4 v2, 0x1

    const-string v3, "WiredAccessoryObserver"

    invoke-virtual {v1, v2, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    iput-object v2, p0, Lcom/android/server/WiredAccessoryObserver;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 157
    iget-object v2, p0, Lcom/android/server/WiredAccessoryObserver;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2, v4}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 158
    const-string v2, "audio"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/AudioManager;

    iput-object v2, p0, Lcom/android/server/WiredAccessoryObserver;->mAudioManager:Landroid/media/AudioManager;

    .line 160
    new-instance v0, Ljava/io/File;

    const-string v2, "/sys/class/switch/dock/state"

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 161
    .local v0, f:Ljava/io/File;
    if-eqz v0, :cond_4e

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_4e

    .line 163
    new-instance v2, Lcom/android/server/WiredAccessoryObserver$SettingsChangedReceiver;

    invoke-direct {v2, p0, v5}, Lcom/android/server/WiredAccessoryObserver$SettingsChangedReceiver;-><init>(Lcom/android/server/WiredAccessoryObserver;Lcom/android/server/WiredAccessoryObserver$1;)V

    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "com.cyanogenmod.settings.SamsungDock"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v2, v3, v5, v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 166
    :cond_4e
    new-instance v2, Lcom/android/server/WiredAccessoryObserver$BootCompletedReceiver;

    invoke-direct {v2, p0, v5}, Lcom/android/server/WiredAccessoryObserver$BootCompletedReceiver;-><init>(Lcom/android/server/WiredAccessoryObserver;Lcom/android/server/WiredAccessoryObserver$1;)V

    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "android.intent.action.BOOT_COMPLETED"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v2, v3, v5, v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 168
    return-void
.end method

.method static synthetic access$200()Ljava/lang/String;
    .registers 1

    .prologue
    .line 42
    sget-object v0, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$302(Lcom/android/server/WiredAccessoryObserver;Z)Z
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 42
    iput-boolean p1, p0, Lcom/android/server/WiredAccessoryObserver;->dockAudioEnabled:Z

    return p1
.end method

.method static synthetic access$400(Lcom/android/server/WiredAccessoryObserver;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/android/server/WiredAccessoryObserver;->init()V

    return-void
.end method

.method static synthetic access$500()Ljava/util/List;
    .registers 1

    .prologue
    .line 42
    sget-object v0, Lcom/android/server/WiredAccessoryObserver;->uEventInfo:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/server/WiredAccessoryObserver;IILjava/lang/String;)V
    .registers 4
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 42
    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/WiredAccessoryObserver;->setDevicesState(IILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lcom/android/server/WiredAccessoryObserver;)Landroid/os/PowerManager$WakeLock;
    .registers 2
    .parameter "x0"

    .prologue
    .line 42
    iget-object v0, p0, Lcom/android/server/WiredAccessoryObserver;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    return-object v0
.end method

.method private final declared-synchronized init()V
    .registers 11

    .prologue
    .line 236
    monitor-enter p0

    const/16 v7, 0x400

    :try_start_3
    new-array v0, v7, [C

    .line 237
    .local v0, buffer:[C
    iget v7, p0, Lcom/android/server/WiredAccessoryObserver;->mHeadsetState:I

    iput v7, p0, Lcom/android/server/WiredAccessoryObserver;->mPrevHeadsetState:I

    .line 239
    sget-object v7, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    const-string v8, "init()"

    invoke-static {v7, v8}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    const/4 v4, 0x0

    .local v4, i:I
    :goto_11
    sget-object v7, Lcom/android/server/WiredAccessoryObserver;->uEventInfo:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-ge v4, v7, :cond_80

    .line 242
    sget-object v7, Lcom/android/server/WiredAccessoryObserver;->uEventInfo:Ljava/util/List;

    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    :try_end_21
    .catchall {:try_start_3 .. :try_end_21} :catchall_74

    .line 245
    .local v6, uei:Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    :try_start_21
    new-instance v3, Ljava/io/FileReader;

    invoke-virtual {v6}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->getSwitchStatePath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 246
    .local v3, file:Ljava/io/FileReader;
    const/4 v7, 0x0

    const/16 v8, 0x400

    invoke-virtual {v3, v0, v7, v8}, Ljava/io/FileReader;->read([CII)I

    move-result v5

    .line 247
    .local v5, len:I
    invoke-virtual {v3}, Ljava/io/FileReader;->close()V

    .line 248
    new-instance v7, Ljava/lang/String;

    const/4 v8, 0x0

    invoke-direct {v7, v0, v8, v5}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 250
    .local v1, curState:I
    if-lez v1, :cond_53

    .line 251
    invoke-virtual {v6}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->getDevPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->getDevName()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v7, v8, v1}, Lcom/android/server/WiredAccessoryObserver;->updateState(Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_53
    .catchall {:try_start_21 .. :try_end_53} :catchall_74
    .catch Ljava/io/FileNotFoundException; {:try_start_21 .. :try_end_53} :catch_56
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_53} :catch_77

    .line 241
    .end local v1           #curState:I
    .end local v3           #file:Ljava/io/FileReader;
    .end local v5           #len:I
    :cond_53
    :goto_53
    add-int/lit8 v4, v4, 0x1

    goto :goto_11

    .line 254
    :catch_56
    move-exception v2

    .line 255
    .local v2, e:Ljava/io/FileNotFoundException;
    :try_start_57
    sget-object v7, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->getSwitchStatePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " not found while attempting to determine initial switch state"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_73
    .catchall {:try_start_57 .. :try_end_73} :catchall_74

    goto :goto_53

    .line 236
    .end local v0           #buffer:[C
    .end local v2           #e:Ljava/io/FileNotFoundException;
    .end local v4           #i:I
    .end local v6           #uei:Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    :catchall_74
    move-exception v7

    monitor-exit p0

    throw v7

    .line 257
    .restart local v0       #buffer:[C
    .restart local v4       #i:I
    .restart local v6       #uei:Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    :catch_77
    move-exception v2

    .line 258
    .local v2, e:Ljava/lang/Exception;
    :try_start_78
    sget-object v7, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    const-string v8, ""

    invoke-static {v7, v8, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7f
    .catchall {:try_start_78 .. :try_end_7f} :catchall_74

    goto :goto_53

    .line 261
    .end local v2           #e:Ljava/lang/Exception;
    .end local v6           #uei:Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    :cond_80
    monitor-exit p0

    return-void
.end method

.method private static makeObservedUEventList()Ljava/util/List;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/server/WiredAccessoryObserver$UEventInfo;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v8, 0x10

    const/16 v7, 0x8

    const/4 v6, 0x4

    const/4 v5, 0x0

    .line 91
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 95
    .local v0, retVal:Ljava/util/List;,"Ljava/util/List<Lcom/android/server/WiredAccessoryObserver$UEventInfo;>;"
    new-instance v1, Lcom/android/server/WiredAccessoryObserver$UEventInfo;

    const-string v2, "h2w"

    const/4 v3, 0x1

    const/4 v4, 0x2

    invoke-direct {v1, v2, v3, v4}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;-><init>(Ljava/lang/String;II)V

    .line 96
    .local v1, uei:Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    invoke-virtual {v1}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->checkSwitchExists()Z

    move-result v2

    if-eqz v2, :cond_4e

    .line 97
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    :goto_1d
    new-instance v1, Lcom/android/server/WiredAccessoryObserver$UEventInfo;

    .end local v1           #uei:Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    const-string v2, "usb_audio"

    invoke-direct {v1, v2, v6, v7}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;-><init>(Ljava/lang/String;II)V

    .line 104
    .restart local v1       #uei:Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    invoke-virtual {v1}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->checkSwitchExists()Z

    move-result v2

    if-eqz v2, :cond_56

    .line 105
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    :goto_2d
    new-instance v1, Lcom/android/server/WiredAccessoryObserver$UEventInfo;

    .end local v1           #uei:Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    const-string v2, "dock"

    invoke-direct {v1, v2, v7, v6}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;-><init>(Ljava/lang/String;II)V

    .line 112
    .restart local v1       #uei:Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    invoke-virtual {v1}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->checkSwitchExists()Z

    move-result v2

    if-eqz v2, :cond_5e

    .line 113
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    :goto_3d
    new-instance v1, Lcom/android/server/WiredAccessoryObserver$UEventInfo;

    .end local v1           #uei:Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    const-string v2, "hdmi_audio"

    invoke-direct {v1, v2, v8, v5}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;-><init>(Ljava/lang/String;II)V

    .line 127
    .restart local v1       #uei:Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    invoke-virtual {v1}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->checkSwitchExists()Z

    move-result v2

    if-eqz v2, :cond_66

    .line 128
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    :goto_4d
    return-object v0

    .line 99
    :cond_4e
    sget-object v2, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    const-string v3, "This kernel does not have wired headset support"

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1d

    .line 107
    :cond_56
    sget-object v2, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    const-string v3, "This kernel does not have usb audio support"

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2d

    .line 115
    :cond_5e
    sget-object v2, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    const-string v3, "This kernel does not have samsung usb dock audio support"

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3d

    .line 130
    :cond_66
    new-instance v1, Lcom/android/server/WiredAccessoryObserver$UEventInfo;

    .end local v1           #uei:Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    const-string v2, "hdmi"

    invoke-direct {v1, v2, v8, v5}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;-><init>(Ljava/lang/String;II)V

    .line 131
    .restart local v1       #uei:Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    invoke-virtual {v1}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->checkSwitchExists()Z

    move-result v2

    if-eqz v2, :cond_77

    .line 132
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4d

    .line 134
    :cond_77
    sget-object v2, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    const-string v3, "This kernel does not have HDMI audio support"

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4d
.end method

.method private final setDeviceState(IIILjava/lang/String;)V
    .registers 11
    .parameter "headset"
    .parameter "headsetState"
    .parameter "prevHeadsetState"
    .parameter "headsetName"

    .prologue
    const/4 v5, 0x1

    .line 320
    and-int v2, p2, p1

    and-int v3, p3, p1

    if-eq v2, v3, :cond_34

    .line 324
    and-int v2, p2, p1

    if-eqz v2, :cond_35

    .line 325
    const/4 v1, 0x1

    .line 330
    .local v1, state:I
    :goto_c
    if-ne p1, v5, :cond_37

    .line 331
    const/4 v0, 0x4

    .line 346
    .local v0, device:I
    :goto_f
    sget-object v3, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "device "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-ne v1, v5, :cond_6a

    const-string v2, " connected"

    :goto_24
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 348
    iget-object v2, p0, Lcom/android/server/WiredAccessoryObserver;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v2, v0, v1, p4}, Landroid/media/AudioManager;->setWiredDeviceConnectionState(IILjava/lang/String;)V

    .line 350
    .end local v0           #device:I
    .end local v1           #state:I
    :cond_34
    :goto_34
    return-void

    .line 327
    :cond_35
    const/4 v1, 0x0

    .restart local v1       #state:I
    goto :goto_c

    .line 332
    :cond_37
    const/4 v2, 0x2

    if-ne p1, v2, :cond_3d

    .line 333
    const/16 v0, 0x8

    .restart local v0       #device:I
    goto :goto_f

    .line 334
    .end local v0           #device:I
    :cond_3d
    const/4 v2, 0x4

    if-ne p1, v2, :cond_43

    .line 335
    const/16 v0, 0x800

    .restart local v0       #device:I
    goto :goto_f

    .line 336
    .end local v0           #device:I
    :cond_43
    const/16 v2, 0x8

    if-ne p1, v2, :cond_4a

    .line 337
    const/16 v0, 0x1000

    .restart local v0       #device:I
    goto :goto_f

    .line 338
    .end local v0           #device:I
    :cond_4a
    const/16 v2, 0x10

    if-ne p1, v2, :cond_51

    .line 339
    const/16 v0, 0x400

    .restart local v0       #device:I
    goto :goto_f

    .line 341
    .end local v0           #device:I
    :cond_51
    sget-object v2, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setDeviceState() invalid headset type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_34

    .line 346
    .restart local v0       #device:I
    :cond_6a
    const-string v2, " disconnected"

    goto :goto_24
.end method

.method private final declared-synchronized setDevicesState(IILjava/lang/String;)V
    .registers 7
    .parameter "headsetState"
    .parameter "prevHeadsetState"
    .parameter "headsetName"

    .prologue
    .line 307
    monitor-enter p0

    const/16 v0, 0x1f

    .line 308
    .local v0, allHeadsets:I
    const/4 v1, 0x1

    .local v1, curHeadset:I
    :goto_4
    if-eqz v0, :cond_13

    .line 309
    and-int v2, v1, v0

    if-eqz v2, :cond_10

    .line 310
    :try_start_a
    invoke-direct {p0, v1, p1, p2, p3}, Lcom/android/server/WiredAccessoryObserver;->setDeviceState(IIILjava/lang/String;)V
    :try_end_d
    .catchall {:try_start_a .. :try_end_d} :catchall_15

    .line 311
    xor-int/lit8 v2, v1, -0x1

    and-int/2addr v0, v2

    .line 308
    :cond_10
    shl-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 314
    :cond_13
    monitor-exit p0

    return-void

    .line 307
    :catchall_15
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private final declared-synchronized update(Ljava/lang/String;I)V
    .registers 18
    .parameter "newName"
    .parameter "newState"

    .prologue
    .line 265
    monitor-enter p0

    and-int/lit8 v4, p2, 0x1f

    .line 266
    .local v4, headsetState:I
    :try_start_3
    iget v9, p0, Lcom/android/server/WiredAccessoryObserver;->mHeadsetState:I

    or-int v5, v4, v9

    .line 267
    .local v5, newOrOld:I
    const/4 v1, 0x0

    .line 268
    .local v1, delay:I
    and-int/lit8 v7, v4, 0x4

    .line 269
    .local v7, usb_headset_anlg:I
    and-int/lit8 v8, v4, 0x8

    .line 270
    .local v8, usb_headset_dgtl:I
    and-int/lit8 v3, v4, 0x3

    .line 271
    .local v3, h2w_headset:I
    const/4 v2, 0x1

    .line 272
    .local v2, h2wStateChange:Z
    const/4 v6, 0x1

    .line 276
    .local v6, usbStateChange:Z
    sget-object v9, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "newState = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move/from16 v0, p2

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", headsetState = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ","

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "mHeadsetState = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, p0, Lcom/android/server/WiredAccessoryObserver;->mHeadsetState:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 278
    iget v9, p0, Lcom/android/server/WiredAccessoryObserver;->mHeadsetState:I

    if-eq v9, v4, :cond_4f

    add-int/lit8 v9, v3, -0x1

    and-int/2addr v9, v3

    if-eqz v9, :cond_57

    .line 279
    :cond_4f
    sget-object v9, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    const-string v10, "unsetting h2w flag"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 280
    const/4 v2, 0x0

    .line 284
    :cond_57
    shr-int/lit8 v9, v7, 0x2

    const/4 v10, 0x1

    if-ne v9, v10, :cond_69

    shr-int/lit8 v9, v8, 0x3

    const/4 v10, 0x1

    if-ne v9, v10, :cond_69

    .line 285
    sget-object v9, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    const-string v10, "unsetting usb flag"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    const/4 v6, 0x0

    .line 288
    :cond_69
    if-nez v2, :cond_76

    if-nez v6, :cond_76

    .line 289
    sget-object v9, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    const-string v10, "invalid transition, returning ..."

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_74
    .catchall {:try_start_3 .. :try_end_74} :catchall_98

    .line 302
    :goto_74
    monitor-exit p0

    return-void

    .line 293
    :cond_76
    :try_start_76
    move-object/from16 v0, p1

    iput-object v0, p0, Lcom/android/server/WiredAccessoryObserver;->mHeadsetName:Ljava/lang/String;

    .line 294
    iget v9, p0, Lcom/android/server/WiredAccessoryObserver;->mHeadsetState:I

    iput v9, p0, Lcom/android/server/WiredAccessoryObserver;->mPrevHeadsetState:I

    .line 295
    iput v4, p0, Lcom/android/server/WiredAccessoryObserver;->mHeadsetState:I

    .line 297
    iget-object v9, p0, Lcom/android/server/WiredAccessoryObserver;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v9}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 298
    iget-object v9, p0, Lcom/android/server/WiredAccessoryObserver;->mHandler:Landroid/os/Handler;

    iget-object v10, p0, Lcom/android/server/WiredAccessoryObserver;->mHandler:Landroid/os/Handler;

    const/4 v11, 0x0

    iget v12, p0, Lcom/android/server/WiredAccessoryObserver;->mHeadsetState:I

    iget v13, p0, Lcom/android/server/WiredAccessoryObserver;->mPrevHeadsetState:I

    iget-object v14, p0, Lcom/android/server/WiredAccessoryObserver;->mHeadsetName:Ljava/lang/String;

    invoke-virtual {v10, v11, v12, v13, v14}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_97
    .catchall {:try_start_76 .. :try_end_97} :catchall_98

    goto :goto_74

    .line 265
    .end local v1           #delay:I
    .end local v2           #h2wStateChange:Z
    .end local v3           #h2w_headset:I
    .end local v5           #newOrOld:I
    .end local v6           #usbStateChange:Z
    .end local v7           #usb_headset_anlg:I
    .end local v8           #usb_headset_dgtl:I
    :catchall_98
    move-exception v9

    monitor-exit p0

    throw v9
.end method

.method private final declared-synchronized updateState(Ljava/lang/String;Ljava/lang/String;I)V
    .registers 7
    .parameter "devPath"
    .parameter "name"
    .parameter "state"

    .prologue
    .line 226
    monitor-enter p0

    const/4 v0, 0x0

    .local v0, i:I
    :goto_2
    :try_start_2
    sget-object v2, Lcom/android/server/WiredAccessoryObserver;->uEventInfo:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_25

    .line 227
    sget-object v2, Lcom/android/server/WiredAccessoryObserver;->uEventInfo:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/WiredAccessoryObserver$UEventInfo;

    .line 228
    .local v1, uei:Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    invoke-virtual {v1}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->getDevPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_27

    .line 229
    iget v2, p0, Lcom/android/server/WiredAccessoryObserver;->mHeadsetState:I

    invoke-virtual {v1, v2, p3}, Lcom/android/server/WiredAccessoryObserver$UEventInfo;->computeNewHeadsetState(II)I

    move-result v2

    invoke-direct {p0, p2, v2}, Lcom/android/server/WiredAccessoryObserver;->update(Ljava/lang/String;I)V
    :try_end_25
    .catchall {:try_start_2 .. :try_end_25} :catchall_2a

    .line 233
    .end local v1           #uei:Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    :cond_25
    monitor-exit p0

    return-void

    .line 226
    .restart local v1       #uei:Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    :cond_27
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .end local v1           #uei:Lcom/android/server/WiredAccessoryObserver$UEventInfo;
    :catchall_2a
    move-exception v2

    monitor-exit p0

    throw v2
.end method


# virtual methods
.method public onUEvent(Landroid/os/UEventObserver$UEvent;)V
    .registers 9
    .parameter "event"

    .prologue
    .line 203
    sget-object v4, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Headset UEVENT: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Landroid/os/UEventObserver$UEvent;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    :try_start_1c
    const-string v4, "DEVPATH"

    invoke-virtual {p1, v4}, Landroid/os/UEventObserver$UEvent;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 207
    .local v0, devPath:Ljava/lang/String;
    const-string v4, "SWITCH_NAME"

    invoke-virtual {p1, v4}, Landroid/os/UEventObserver$UEvent;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 208
    .local v2, name:Ljava/lang/String;
    const-string v4, "dock"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4d

    .line 213
    iget-boolean v4, p0, Lcom/android/server/WiredAccessoryObserver;->dockAudioEnabled:Z

    if-nez v4, :cond_4d

    .line 214
    sget-object v4, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Ignoring dock event as Audio routing disabled "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    .end local v0           #devPath:Ljava/lang/String;
    .end local v2           #name:Ljava/lang/String;
    :goto_4c
    return-void

    .line 218
    .restart local v0       #devPath:Ljava/lang/String;
    .restart local v2       #name:Ljava/lang/String;
    :cond_4d
    const-string v4, "SWITCH_STATE"

    invoke-virtual {p1, v4}, Landroid/os/UEventObserver$UEvent;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 219
    .local v3, state:I
    invoke-direct {p0, v0, v2, v3}, Lcom/android/server/WiredAccessoryObserver;->updateState(Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_5a
    .catch Ljava/lang/NumberFormatException; {:try_start_1c .. :try_end_5a} :catch_5b

    goto :goto_4c

    .line 220
    .end local v0           #devPath:Ljava/lang/String;
    .end local v2           #name:Ljava/lang/String;
    .end local v3           #state:I
    :catch_5b
    move-exception v1

    .line 221
    .local v1, e:Ljava/lang/NumberFormatException;
    sget-object v4, Lcom/android/server/WiredAccessoryObserver;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Could not parse switch state from event "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4c
.end method
